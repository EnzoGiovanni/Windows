#MAking a Black list domain for UnBound
Clear-Host

$File = "$env:USERPROFILE\Downloads\BlackListDomain.conf"
$TMP = "$env:USERPROFILE\Downloads\temp.conf"

$url = 'http://1hosts.cf/'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $File -Encoding Unicode
Gc $File | ?{$_ -Match "^0.0.0.0.*$"} | %{$_.Remove(0, 8)} | Sort -Unique | %{'local-zone: "' +  $_ + '" always_nxdomain'} | Sc $File -Encoding Unicode


$url = 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts'
$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $TMP -Encoding Unicode
Gc $TMP | ?{$_ -Match "^0.0.0.0.*$"} | %{$_.Remove(0, 8)} | Sort -Unique | %{'local-zone: "' +  $_ + '" always_nxdomain'} | Ac $File -Encoding Unicode


#Convert To Unix File Format
Gci $File | %{
  # get the contents and replace line breaks by U+000A
  $contents = [IO.File]::ReadAllText($_) -replace "`r`n?", "`n"
  # create UTF-8 encoding without signature
  $utf8 = New-Object System.Text.UTF8Encoding $false
  # write the text back
  [IO.File]::WriteAllText($_, $contents, $utf8)
}
