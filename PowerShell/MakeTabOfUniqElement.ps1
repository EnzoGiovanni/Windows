# à partir d'un fichier text,
# création d'une tableau d'élément unique

$Text-File = "Chemin\FileName.ext"

$Lines = Get-Content $Text-File

" déclaration du tableau dynamique
$idPM = @()

#pour chaque ligne, sélection de l'émément à traiter
ForEach ($line in $Lines)
{
    $idPM+=$line.Substring(118,7)  
}

#dédoublonnage
$idPM = $idPM | Sort-object | Get-Unique
