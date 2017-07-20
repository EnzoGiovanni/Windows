# à partir d'un fichier texte,
# création d'un tableau d'élément unique

$Text-File = "Chemin\FileName.ext"

$Lines = Get-Content $Text-File

# déclaration du tableau dynamique
$Elt = @()

# pour chaque ligne, sélection de l'émément à traiter
ForEach ($line in $Lines)
{
    $Elt+=$line.Substring(118,7)  
}

# ordonnancement puis dédoublonnage
$Elt = $Elt | Sort-object | Get-Unique
