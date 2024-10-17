

# Vérification de la présence de Winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget n'est pas installé ou disponible." -ForegroundColor Red
    exit
}

# Création du dossier de logs si nécessaire
$logFolder = "C:\Logs"
if (-not (Test-Path $logFolder)) {
    New-Item -Path $logFolder -ItemType Directory -Force
}

# Journalisation des mises à jour dans un fichier
$logFile = "$logFolder\winget_updates.log"

Write-Host "Démarrage des mises à jour..." -ForegroundColor Yellow

# Exécution de Winget et capture des erreurs
try {
    $wingetOutput = winget upgrade --all 2>&1

    # Journalisation de la sortie de winget
    Add-Content -Path $logFile -Value $wingetOutput

    Write-Host "Mises à jour terminées." -ForegroundColor Green
    Add-Content -Path $logFile -Value "Mises à jour terminées le $(Get-Date)"
} catch {
    Write-Host "Erreur lors de l'exécution de Winget : $_" -ForegroundColor Red
    Add-Content -Path $logFile -Value "Erreur lors de l'exécution de Winget : $_"
    exit
}
