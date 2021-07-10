Gci -Force -Recurse -Path "D:\PHOTOS"  | where {$_.extension -in ".jpg", ".png", ".jpeg", ".tif"} | Measure-Object -Property Length -Sum
