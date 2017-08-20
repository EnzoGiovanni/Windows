# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-5.1#examples

$REP = ""

$Exts = Get-ChildItem $REP -Recurse -Force -File -exclude *.jpg, *.JPG, *.jpeg, *.Rw2 |Select-Object -Property Extension

$Exts  | Sort-Object Extension | Set-Content "C:\Users\Olivier\Downloads\Extentions.txt"
