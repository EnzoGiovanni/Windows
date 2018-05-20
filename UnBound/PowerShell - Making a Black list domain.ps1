#Making a Black list domain for UnBound
Clear-Host
get-date
###################################################################################################################
$File = "$env:USERPROFILE\Downloads\BlackListDomain.conf"
$TMP = "$env:USERPROFILE\Downloads\temp.conf"

$WhtLst = @(
“mine.nu”,
”1hosts.cf”,
"hostsfile.org",
"adzhosts.fr"
)
$WhtLst = $WhtLst | Sort -Unique

###################################################################################################################
Write-Host 'Start from Old List'
$Lignes = Gc "$env:ProgramFiles\Unbound\BlackListDomain.conf"
$Lignes.count;
$Lignes | % {$_.Remove(0, 13).Split('" ')[0]} | Sc $File

###################################################################################################################
Write-Host 'Updadating with host sources'
$url = 'http://1hosts.cf/'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Sort -Unique | Ac $File


$url = 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Sort -Unique | Ac $File


$url = 'http://www.hostsfile.org/Downloads/hosts.txt'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(127.0.0.1)"} | %{$_.Remove(0, 12).Trim()} | Sort -Unique | Ac $File


$url = 'http://hostsfile.mine.nu/hosts0.txt'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Sort -Unique | Ac $File


#$url = 'https://adzhosts.fr/hosts/AdZGuardFilter.txt'
#$page = Invoke-WebRequest -Uri $url
#$page.RawContent | Sc $TMP
#Gc $TMP | ?{$_ -Match "^(||)"} | %{$_.Remove(0, 3).Trim()} | Sort -Unique | Ac $File

###################################################################################################################
Write-Host 'Updadating with local sources'
If(Test-Path "$env:USERPROFILE\Downloads\liste.txt")
    {Gc "$env:USERPROFILE\Downloads\liste.txt" | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Sort -Unique | Ac $File}

If(Test-Path "$env:USERPROFILE\Downloads\AdZGuardFilter.txt")
    {Gc "$env:USERPROFILE\Downloads\AdZGuardFilter.txt" | ?{$_ -Like "||*"} | %{$_.Remove(0, 3).Trim()} | Sort -Unique | Ac $File}

Remove-Item $TMP
###################################################################################################################
$Lignes = Gc $File | Sort -Unique
Write-Host 'Cleaning 1'
$Lignes = $Lignes | %{If($_ -Like "#*"){$_.Remove(0, 1)} Else {$_}}

Write-Host 'Cleaning 2'
$Lignes = $Lignes | %{
                        $Elts = $_.Split('.');
                        If($Elts[0] -Like "WWW*")
                        {$Elts[1..$Elts.Count] -join(".")}
                        Else
                            {$Elts[0..$Elts.Count] -join(".")};
                      } `
                  | Sort -Unique

Write-Host 'Cleaning 3'
$Lignes = Gc $File | %{If($_ -Like ".*"){$_.Remove(0, 1)} Else {$_}} | Sort -Unique

###################################################################################################################
Write-Host 'Filtering'         
$Lignes = $Lignes | ?{$WhtLst -notcontains $_}
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

get-date

Remove-variable -name Lignes, Elts, contents, utf8, WhtLst
