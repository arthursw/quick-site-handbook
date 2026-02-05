# Quick Site Handbook - Install Tools Script
# This script installs pixi, git, and hugo globally

param(
    [switch]$help
)

if ($help) {
    Write-Host "Quick Site Handbook - Install Tools Script" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "This script installs Pixi, Git, and Hugo globally on your system." -ForegroundColor White
    Write-Host ""
    Write-Host "Usage: .\install-tools.ps1" -ForegroundColor Green
    Write-Host ""
    Write-Host "After running, you can create sites using the 'Create Site Only' command."
    exit 0
}

Write-Host "🚀 Quick Site Handbook - Installing Tools" -ForegroundColor Cyan
Write-Host ""

# Install pixi if not present
Write-Host "📦 Checking for Pixi..." -ForegroundColor Yellow
$PixiInstalled = $false
try {
    $null = Get-Command pixi -ErrorAction Stop
    $PixiInstalled = $true
} catch {
    $PixiInstalled = $false
}

if (-not $PixiInstalled) {
    Write-Host "   Pixi not found. Installing..." -ForegroundColor White
    powershell -ExecutionPolicy Bypass -c "irm -useb https://pixi.sh/install.ps1 | iex"
    
    # Add pixi to PATH for this session
    $env:PATH = "$env:USERPROFILE\.pixi\bin;$env:PATH"
    
    # Verify installation
    try {
        $null = Get-Command pixi -ErrorAction Stop
        Write-Host "   ✅ Pixi installed!" -ForegroundColor Green
    } catch {
        Write-Host "❌ Failed to install Pixi. Please install manually: https://pixi.sh" -ForegroundColor Red
        exit 1
    }
} else {
    $pixiVersion = pixi --version
    Write-Host "   ✅ Pixi already installed ($pixiVersion)" -ForegroundColor Green
}

Write-Host ""
Write-Host "⬇️ Installing Git globally..." -ForegroundColor Yellow
pixi global install git
Write-Host "   ✅ Git installed!" -ForegroundColor Green

Write-Host ""
Write-Host "⬇️ Installing Hugo globally..." -ForegroundColor Yellow
pixi global install hugo
Write-Host "   ✅ Hugo installed!" -ForegroundColor Green

# Refresh PATH to pick up new installations
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "User")

Write-Host ""
Write-Host "✅ All tools installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Installed versions:" -ForegroundColor Cyan
try {
    $pv = pixi --version
    Write-Host "   $pv"
} catch {}
try {
    $gv = git --version
    Write-Host "   $gv"
} catch {}
try {
    $hv = hugo version
    Write-Host "   $hv"
} catch {}

Write-Host ""
Write-Host "You can now create sites using the 'Create Site Only' command." -ForegroundColor Yellow
Write-Host "Visit: https://arthursw.github.io/quick-site-handbook/command-generator"
Write-Host ""
Write-Host "⚠️  Note: You may need to restart PowerShell for all tools to be available." -ForegroundColor Magenta
Write-Host ""
