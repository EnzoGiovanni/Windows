# ouvrir une session du navigateur EDGE isolée,
# à chaque éxécution créer un repertoire de travail temporaire unique
# puis lance edge avec ce repertoire de travail dans une nouvelle fenêtre privée du navigateur,
# ce qui a pour effet de créer une nouvelle instance d'exécution de edge (nouveau PID)

# ce sript est à appeler depuis un racourcis windows tel que :
# C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%USERPROFILE%\{chemin}\nom du script script.ps1"
# Crée un dossier temporaire unique pour le profil
$d = Join-Path $env:TEMP ("EdgeIso-" + (Get-Random))

# Chemin vers Edge (adapter si nécessaire)
$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

# Arguments : profil jetable + InPrivate + nouvelle fenêtre
$args = @("--user-data-dir=$d","--inprivate","--new-window https://domaine/index.com")

# Lancer Edge
Start-Process $edge -ArgumentList $args
