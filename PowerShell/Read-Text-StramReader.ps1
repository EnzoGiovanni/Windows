$File = "C:\Users\X119197\Downloads\essai"

Write-Host "Lecture Fichier"

$reader = New-Object System.IO.StreamReader($File)
#Lecture du fichier ligne par ligne
Do
{
  $Ligne = $reader.ReadLine() #lit la ligne suivante
}
While (!($reader.EndOfStream)) Lit tant qu'on n'a pas atteint la dernièrre ligne
$reader.Close()

# Source :
# https://community.spiceworks.com/topic/962065-powershell-get-content-alternative

# voir Aussi "StreamReader Methods" :
# https://msdn.microsoft.com/en-us/library/system.io.streamreader_methods(v=vs.110).aspx
# 
# StreamReader Class :
# https://msdn.microsoft.com/en-us/library/system.io.streamreader(v=vs.110).aspx
