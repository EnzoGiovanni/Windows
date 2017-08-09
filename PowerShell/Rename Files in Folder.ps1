# répertoire de travail
$Rep = "chemin"
 
ForEach ($Flux In Get-ChildItem $Rep)
{
    Write-Host $Flux
 
    Switch ($Flux)
    {
        "file name 1"{
            $OldFileName = $Rep + $Flux
            $NewFileName = $Rep + "new name 1"
            Rename-Item -Path $OldFileName -NewName $NewFileName}
    
        "file name n"{
            $OldFileName = $Rep + $Flux
            $NewFileName = $Rep + "new name n"
            Rename-Item -Path $OldFileName -NewName $NewFileName}
    
    }
}
