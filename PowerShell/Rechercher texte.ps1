# Rechercher du texte dans une arborescence de fichier texte

####################################################################################################################################
$Rep = " repertoire où scanner les fichiers textes "
$FileOut = " fichiers résultats "

####################################################################################################################################
$FileName = " ???? "

$RegEx = " ??? "


####################################################################################################################################
$fluxs = Get-ChildItem -LiteralPath $Rep | where {($_.Attributes -ne 'Directory')  -and ($_.Name -Like $FileName) } | sort-Object
If ($FileOut -ne $null) {Remove-Item $FileOut}
ForEach ($Flux In $fluxs)
{
    $Ligne = get-content ($Rep + $Flux) | where {$_  -match $RegEx}
    If ($Ligne -ne $null)
    {
        If ($Ligne.length -ne $null)
        {
            Write-Host $Flux
            #Write-host $Ligne
            $Flux | Add-Content $FileOut
            $Ligne | Add-Content $FileOut
            Clear-Variable Ligne
        }
    }
    
}
