if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget n'est pas installé ou disponible." -ForegroundColor Red
    exit
}

winget upgrade --all



Write-Host "Mises à jour terminées." -ForegroundColor Green