#Normalisation d'un CSV

$Rep = (Get-Item env:\USERPROFILE).value + "\Downloads\"
$FileIn = $Rep + "FichierIn.csv"
$FileOut = $Rep + "fichierOut.csv"

$Lignes = Get-Content $FileIn

ForEach ($Ligne In $Lignes)
{
    $Elts = $Ligne.split(";")
    $NewLine = ""
    ForEach ($Elt In $Elts){$NewLine = $NewLine + '"' + $Elt + '"' + ';'}
    $NewLine | Add-Content $FileOut
}
