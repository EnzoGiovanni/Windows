#Making a Black list domain for UnBound
Clear-Host

$File = "$env:USERPROFILE\Downloads\BlackListDomain.conf"

$url = 'http://1hosts.cf/'

$page = Invoke-WebRequest -Uri $url
$page.RawContent | Sc $File -Encoding Unicode
Gc $File | ?{$_ -Match "^0.0.0.0.*$"} | %{$_.Remove(0, 8)} | Sort -Unique | %{'local-zone: "' +  $_ + '" always_nxdomain'} | Sc $File -Encoding Unicode
