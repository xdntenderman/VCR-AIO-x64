# Paste link Release ZIP lu di bawah ini
$zipUrl = "https://github.com/xdntenderman/VCR-AIO-x64/releases/download/1.0/VCR_AIO.X64.zip"

$tempZip = "$env:TEMP\vcredist_aio.zip"
$tempFolder = "$env:TEMP\vcredist_extracted"

Write-Host "Downloading Files Please Wait..." -ForegroundColor Cyan

# Enable progress bar untuk download
$ProgressPreference = 'Continue'
Invoke-WebRequest -Uri $zipUrl -OutFile $tempZip

Write-Host "Extracting Files..." -ForegroundColor Yellow
if (Test-Path $tempFolder) { Remove-Item -Path $tempFolder -Recurse -Force }
New-Item -ItemType Directory -Path $tempFolder | Out-Null
Expand-Archive -Path $tempZip -DestinationPath $tempFolder -Force

$batFile = Get-ChildItem -Path $tempFolder -Filter "install_all.bat" -Recurse | Select-Object -First 1

if ($batFile) {
    Write-Host "Mengeksekusi installer (Pilih YES kalau muncul pop-up Admin)..." -ForegroundColor Green
    Start-Process -FilePath $batFile.FullName -WorkingDirectory $batFile.DirectoryName -Wait -Verb RunAs
} else {
    Write-Host "Error: install_all.bat not found." -ForegroundColor Red
}

Write-Host "Cleaning up temporary files..." -ForegroundColor Cyan
Remove-Item -Path $tempZip -Force
Remove-Item -Path $tempFolder -Recurse -Force

Write-Host "Done VCRedist is installed! ." -ForegroundColor Green
