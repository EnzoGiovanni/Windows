# Comparer une sauvergarde par rapport à sa source
#  => Lister les différences

$Source_Z = "D:\X119197\DEV\Source"
$Backup_Z = "D:\X119197\DEV\BackUp"



# Arborescence des repertoires
$Src = Get-ChildItem -LiteralPath $Source_Z -Force -Recurse | where {$_.Attributes -eq 'Directory'} | Select-Object -Property FullName
$Bkp = Get-ChildItem -LiteralPath $Backup_Z -Force -Recurse | where {$_.Attributes -eq 'Directory'} | Select-Object -Property FullName





$Src = $Src | Sort -Property FullName
$Bkp = $Bkp | Sort -Property FullName

$Arbo = @()
ForEach ($Elts In $Src)
{
    
    
    
    #$Elt = $Elts.Split("\")
    
    #$NBLevelofSrc = $Elt.Split("\").count
    
    Write-Host $Elts | Select-Object -Property FullName
    
    #$Arbo+= ($Src[$i].Split("\"))[$NBLevelofSrc..$Zones.length] -Join(";")
    
    
}
    Write-host $Arbo
