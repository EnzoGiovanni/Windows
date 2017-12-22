# Comparer une sauvergarde par rapport à sa source
#  => Lister les différences

$Source_Z = "rep source"
$Backup_Z = "rep BackUp"
$NBSrcZ = $Source_Z.Split("\").Count

# Arborescence des repertoires
$Src = Get-ChildItem -LiteralPath $Source_Z -Force -Recurse | where {$_.Attributes -eq 'Directory'} | Select-Object -Property FullName
$Bkp = Get-ChildItem -LiteralPath $Backup_Z -Force -Recurse | where {$_.Attributes -eq 'Directory'} | Select-Object -Property FullName

$Src = $Src | Sort -Property FullName
$Bkp = $Bkp | Sort -Property FullName

$Arbo = @()
ForEach ($Elts In $Src)
{
    $Elt = $Elts.FullName.Split("\")
    $Elt =  $Elt[$NBSrcZ..$Elt.count] -Join "\"
    $Arbo+= "\" + $Elt  
}
