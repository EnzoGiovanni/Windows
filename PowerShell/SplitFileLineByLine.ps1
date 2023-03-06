###################################################################################################################
# Spliter un fichier avec une limite du nimbre de ligne
###################################################################################################################
# Initialise PowerShell
Rv * -Scope Global -Force -Ea SilentlyContinue; rmo *; $error.Clear(); Cls
get-date
Write-Host ' '

###################################################################################################################
$Rep = "C:\Users\obaudoin\Documents\SMB\Base Sirene des entreprises\Datas\"

$FileIN =   $Rep + "StockEtablissement_utf8.csv"


$LigneMaxByFile = 5000000


###################################################################################################################
$NumLigneCourante = 0
$FileIdx = 1
$reader = New-Object System.IO.StreamReader($FileIN)


###################################################################################################################
Do {
    
    $FileOUT = $Rep + "StockEtablissement_utf8" + "_Splited N°" + $FileIdx + ".csv"
    Write-Host $FileOUT
    $writer = New-Object System.IO.StreamWriter($FileOUT)
    ###########################################################"
    #Lecture du fichier ligne par ligne
    Do {
      $Ligne = $reader.ReadLine()
      $NumLigneCourante ++
      $writer.WriteLine($Ligne)
    }
    While ( (!($reader.EndOfStream)) -And ( $NumLigneCourante -lt $LigneMaxByFile ) ) #Lit tant qu'on n'a pas atteint la dernière ligne ou le nombre max de ligne à lire
    ###########################################################"
    $Writer.Close()
    Write-Host ''
    $NumLigneCourante = 0
    $FileIdx ++

}
While (!($reader.EndOfStream))


$reader.Close()
###################################################################################################################
