#https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference

# depuis un fichier texte d'entrée,
# filtre des lignes avec une RegEx,
" puis envoie du résultat dans un fichier de sorti


$FileIn = "chemin\FileIn.txt"
$FileOut = "chemin\FileOn.txt"

$Lines = Get-Content $FileIn | Where-Object {$_  -match 'RegEx cf liens'} | Set-content $FileOut
