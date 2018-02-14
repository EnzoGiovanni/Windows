# Comparer une sauvergarde par rapport à sa source
#  => Lister les différences

$Source_Z = "rep source"
$Backup_Z = "rep BackUp"
$NBSrcZ = $Source_Z.Split("\").Count

# Arborescence des repertoires relatives
$Src = Get-ChildItem -LiteralPath $Source_Z -Force -Recurse | Select-Object -Property FullName | Sort -Property FullName

$Arbo = @()
ForEach ($Elts In $Src)
{
    $Elt = $Elts.FullName.Split("\")
    $Elt =  $Elt[$NBSrcZ..$Elt.count] -Join "\"
    $Arbo+= "\" + $Elt  
}

ForEach ($Obj In $Arbo)
{
    
    If (Test-Path -Path ($Source_Z + $Obj))
        {$Src = Get-ChildItem ($Source_Z + $Obj)}
    Else
    {
        Write-Host 'TestPath source KO : ' $Source_Z + $Obj
    }
    
    
    If (Test-Path -Path ($Backup_Z + $Obj))
    {
        $Bkp = Get-ChildItem ($Backup_Z + $Obj)
        If($Src.LastWriteTime -ne $Bkp.LastWriteTime)
        {
            Write-Host 'LastWriteTime KO : ' $Bkp
        }
    }
    Else
    {
        Write-Host 'TestPath BackUp KO : ' $Backup_Z + $Obj 
    }
        
}
