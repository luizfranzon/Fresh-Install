# Certifique-se de estar executando como Administrador
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  Write-Host "Por favor, execute este script como administrador." -ForegroundColor Red
  exit
}

# Verificar se o Chocolatey está instalado
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
  Write-Host "Chocolatey não encontrado. Instalando Chocolatey..." -ForegroundColor Yellow
  Set-ExecutionPolicy Bypass -Scope Process -Force
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  RefreshEnv
}
else {
  Write-Host "Chocolatey já está instalado." -ForegroundColor Green
}

# Lista de pacotes para instalar
$packages = @(
  "azure-data-studio",
  "docker-desktop",
  "figma",
  "git.install",
  "gh",
  "gitkraken",
  "GoogleChrome",
  "googledrive",
  "intellijidea-ultimate",
  "lghub",
  "nvm.install",
  "oh-my-posh",
  "postman",
  "powertoys",
  "qbittorrent",
  "responsively",
  "sharex",
  "spotify",
  "steam",
  "vlc.install",
  "vscode.install",
  "microsoft-windows-terminal",
  "winrar",
  "neovim",
  "bitwarden",
  "ripgrep", 
  "wget", 
  "fd", 
  "unzip", 
  "gzip", 
  "mingw", 
  "make"
)

# Instalar os pacotes
foreach ($package in $packages) {
  Write-Host "Instalando $package..." -ForegroundColor Cyan
  choco install $package -y --ignore-checksums
}

Write-Host "Instalação concluída!" -ForegroundColor Green
