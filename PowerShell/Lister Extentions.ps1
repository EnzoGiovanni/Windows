$REP = ""

$Exts = Get-ChildItem $REP -Recurse -Force -exclude *.jpg, *.JPG, *.jpeg, *.Rw2 |Select-Object -Property Extension

$Exts  | Sort-Object Extension | Set-Content "C:\Users\Olivier\Downloads\Extentions.txt"
