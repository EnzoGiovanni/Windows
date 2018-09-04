# Source :
# https://www.saotn.org/unzip-file-powershell/
# https://msdn.microsoft.com/fr-fr/library/system.io.compression.zipfile(v=vs.110).aspx

Add-Type -AssemblyName System.IO.Compression.FileSystem

function unzip {
    param( [string]$ziparchive, [string]$extractpath )
    [System.IO.Compression.ZipFile]::ExtractToDirectory( $ziparchive, $extractpath )
}

unzip "D:\file.zip" "C:\temp"

