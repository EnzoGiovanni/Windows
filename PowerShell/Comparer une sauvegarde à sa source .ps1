# Comparer une sauvergarde par rapport à sa source
#  => Lister les différences

$Source_Z = "rep source"
$Backup_Z = "rep BackUp"
$NBSrcZ = $Source_Z.Split("\").Count

# Arborescence des repertoires relatives
$Src = Get-ChildItem -LiteralPath $Source_Z -Force -Recurse | where {$_.Attributes -eq 'Directory'} | Select-Object -Property FullName | Sort -Property FullName

$Arbo = @()
ForEach ($Elts In $Src)
{
    $Elt = $Elts.FullName.Split("\")
    $Elt =  $Elt[$NBSrcZ..$Elt.count] -Join "\"
    $Arbo+= "\" + $Elt  
}
Write-Host $Arbo | Format-list
