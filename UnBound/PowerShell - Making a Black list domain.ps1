#Making a Black list domain for UnBound
Clear-Host
get-date
###################################################################################################################
$File = "$env:USERPROFILE\Downloads\BlackListDomain.conf"
$TMP = "$env:USERPROFILE\Downloads\temp.conf"

###################################################################################################################
If(Test-Path $File) {Remove-Item $File}

###################################################################################################################
# Chargement de la White liste
$WhtLst = @()
$reader = New-Object System.IO.StreamReader("C:\Users\Olivier\Synchro NAS\IT\PowerShell\WhiteList.dns")
Do {$WhtLst+= $reader.ReadLine()} While (!($reader.EndOfStream))
$reader.Close()
$WhtLst = $WhtLst | Sort -Unique


###################################################################################################################
<#
Write-Host 'Start from Old List'
$Lignes = Gc "$env:ProgramFiles\Unbound\BlackListDomain.conf"
$Lignes.count;
$Lignes | % {$_.Remove(0, 13).Split('" ')[0]} | Sc $File
#>

###################################################################################################################
Write-Host 'Updating with host sources'
$url = 'http://1hosts.cf/'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Ac $File

<#
$url = 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Ac $File


$url = 'http://www.hostsfile.org/Downloads/hosts.txt'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(127.0.0.1)"} | %{$_.Remove(0, 12).Trim()} | Ac $File


$url = 'http://hostsfile.mine.nu/hosts0.txt'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Ac $File
#>

$url = 'https://adzhosts.fr/hosts/adzhosts-mac-linux.txt'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Sort -Unique | Ac $File

###################################################################################################################
<#
Write-Host 'Updating with local sources'
If(Test-Path "$env:USERPROFILE\Downloads\liste.txt")
    {Gc "$env:USERPROFILE\Downloads\liste.txt" | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Ac $File}
<#
If(Test-Path "$env:USERPROFILE\Downloads\AdZGuardFilter.txt")
    {Gc "$env:USERPROFILE\Downloads\AdZGuardFilter.txt" | ?{$_ -Like "||*"} | %{$_.Remove(0, 3).Trim()} | Ac $File}
#>
Remove-Item $TMP
###################################################################################################################
Gc $File | Sort -Unique | Sc $File
<#
Write-Host 'Cleaning 1'
$Lignes = $Lignes | %{If($_ -Like "#*"){$_.Remove(0, 1)} Else {$_}}


Write-Host 'Cleaning 2'
$Lignes = $Lignes | %{
                        $Elts = $_.Split(".");
                        If($Elts[0] -Like "WWW*")
                            {$Elts[1..$Elts.Count] -join(".")}
                        Else
                            {$Elts[0..$Elts.Count] -join(".")};
                      } `
                  | Sort -Unique

Write-Host 'Cleaning 3'
$Lignes = Gc $File | %{If($_ -Like ".*"){$_.Remove(0, 1)} Else {$_}} | Sort -Unique
#>
###################################################################################################################
Write-Host 'Filtering'         
$Lignes = Gc $File | ?{$WhtLst -NotContains $_}
$Lignes = $Lignes | %{'local-zone: "' + $_ + '" always_nxdomain'}
$Lignes.Count
$Lignes | Sc $File

###################################################################################################################
Write-Host 'Convert To Unix File Format'
Gci $File | %{
  # get the contents and replace line breaks by U+000A
  $contents = [IO.File]::ReadAllText($_) -replace "`r`n?", "`n"
  # create UTF-8 encoding without signature
  $utf8 = New-Object System.Text.UTF8Encoding $false
  # write the text back
  [IO.File]::WriteAllText($_, $contents, $utf8)
}

###################################################################################################################
Write-Host 'copie BlackListDomain.conf to UnBound Directory'
Copy-Item "$env:USERPROFILE\Downloads\BlackListDomain.conf" -Destination "C:\Program Files\Unbound"

Write-Host 'Rdémarrer le service UnBound'
Get-Service -name unbound | Restart-Service
Get-Service -name unbound

###################################################################################################################
get-date

Remove-variable -name Lignes, contents, utf8, WhtLst
