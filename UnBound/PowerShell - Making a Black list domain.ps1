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
Write-Host 'Updating with 1hosts.cf'
$url = 'http://1hosts.cf/'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Ac $File

Write-Host 'Updating with adzhosts.fr'
$url = 'https://adzhosts.eu/hosts/adzhosts-mac-linux.txt'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(0.0.0.0)"} | %{$_.Remove(0, 8).Trim()} | Sort -Unique | Ac $File


Remove-Item $TMP

###################################################################################################################
Gc $File | Sort -Unique | Sc $File

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
Copy-Item "$env:USERPROFILE\Downloads\BlackListDomain.conf" -Destination "C:\Program Files\Unbound\"

Write-Host 'Rdémarrer le service UnBound'
Get-Service -name unbound | Restart-Service
Get-Service -name unbound

###################################################################################################################
Clear-DnsClientCache

###################################################################################################################
get-date

Remove-variable -name Lignes, contents, utf8, WhtLst
