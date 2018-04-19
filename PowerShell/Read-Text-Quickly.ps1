$File = "C:\Users\X119197\Downloads\essai"

Write-Host "Lecture Fichier"

$reader = New-Object System.IO.StreamReader($File)
$Ligne = $reader.ReadLine()
$Ligne = $reader.ReadLine()
$reader.Close()

# Source :
# https://community.spiceworks.com/topic/962065-powershell-get-content-alternative

# voir Aussi "StreamReader Methods" :
# https://msdn.microsoft.com/en-us/library/system.io.streamreader_methods(v=vs.110).aspx
# 
# StreamReader Class :
# https://msdn.microsoft.com/en-us/library/system.io.streamreader(v=vs.110).aspx
