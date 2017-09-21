#Lister les fichiers d'un répertoire

$Rep = "chemin du repertoire"

Get-ChildItem -LiteralPath $Rep -Force | where {$_.Attributes -ne 'Directory'}
