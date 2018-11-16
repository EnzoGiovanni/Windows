$reader = New-Object System.IO.StreamReader($FileIN)
$writer = New-Object System.IO.StreamWriter($FileOUT)

$Liste = new-object System.Collections.Generic.HashSet[string]
$ListeEnumere = new-object system.collections.generic.List[string] $Liste; #Pourtrier et ordonner

#Lecture du fichier ligne par ligne
Do
{
  $Ligne = $reader.ReadLine()
  $writer.WriteLine($Ligne)
}
While (!($reader.EndOfStream)) #Lit tant qu'on n'a pas atteint la dernièrre ligne

$reader.Close()
$Writer.Close()

# Source :
# https://community.spiceworks.com/topic/962065-powershell-get-content-alternative

# voir Aussi "StreamReader Methods" :
# https://msdn.microsoft.com/en-us/library/system.io.streamreader_methods(v=vs.110).aspx
# 
# StreamReader Class :
# https://msdn.microsoft.com/en-us/library/system.io.streamreader(v=vs.110).aspx

# StreamWriter Class :
# https://msdn.microsoft.com/fr-fr/library/system.io.streamwriter(v=vs.110).aspx
