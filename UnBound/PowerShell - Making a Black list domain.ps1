#Making a Black list domain for UnBound
Clear-Host
get-date
Write-Host ""
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
Write-Host 'Updating with https://hosts-file.net/download/hosts.txt'
$url = 'https://hosts-file.net/download/hosts.txt'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(127.0.0.1).*$"} | %{$_.Remove(0, 10).Trim()} | Ac $File
Remove-Item $TMP

Write-Host 'Updating with https://hosts-file.net/hphosts-partial.txt'
$url = 'https://hosts-file.net/hphosts-partial.txt'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(127.0.0.1).*$"} | %{$_.Remove(0, 10).Trim()} | Ac $File
Remove-Item $TMP

Write-Host 'Updating with http://1hosts.cf/'
$url = 'http://1hosts.cf/'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP
Gc $TMP | ?{$_ -Match "^(0.0.0.0).*$"} | %{$_.Remove(0, 8).Trim()} | Ac $File
Remove-Item $TMP


###################################################################################################################
Write-Host ""
Write-Host 'tri unique' 
Gc $File | Sort -Unique | Sc $File

###################################################################################################################
Write-Host ""
Write-Host 'Filtering'         
$Lignes = Gc $File
$Lignes | ?{$WhtLst -NotContains $_} | %{'local-zone: "' + $_ + '" always_nxdomain'} | Sc $File

Write-Host ""
$Lignes.Count

###################################################################################################################
Write-Host ""
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
Write-Host ""
Write-Host 'copie BlackListDomain.conf to UnBound Directory'
Copy-Item "$env:USERPROFILE\Downloads\BlackListDomain.conf" -Destination "C:\Program Files\Unbound\"

Write-Host ""
Write-Host 'Rdémarrer le service UnBound'
Get-Service -name unbound | Restart-Service
Get-Service -name unbound

###################################################################################################################
Clear-DnsClientCache

###################################################################################################################
get-date

Remove-variable -name Lignes, contents, utf8, WhtLst
