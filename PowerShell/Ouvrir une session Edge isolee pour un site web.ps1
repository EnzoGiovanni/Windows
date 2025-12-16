
# Crée un dossier temporaire unique pour le profil
$d = Join-Path $env:TEMP ("EdgeIso-" + (Get-Random))

# Chemin vers Edge (adapter si nécessaire)
$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

# Arguments : profil jetable + InPrivate + nouvelle fenêtre
$args = @("--user-data-dir=$d","--inprivate","--new-window https://reftech-adm-rec1.internal.fd-recette.net/login")

# Lancer Edge
Start-Process $edge -ArgumentList $args
