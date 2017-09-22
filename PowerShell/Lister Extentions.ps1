# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-5.1#examples

$REP = ""

$Exts = Get-ChildItem -Force -Recurse -LiteralPath $Rep | where {($_.Attributes -ne 'Directory')} | Select-Object -Property Extension | Sort-Object -Property Extension -Unique

