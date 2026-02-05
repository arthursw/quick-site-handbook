# Quick Site Handbook - Create Site Script (Ultimate Command)
# This script: installs pixi if needed, creates env, installs tools, creates Hugo site with theme

param(
    [Parameter(Mandatory=$false)]
    [string]$s,
    
    [Parameter(Mandatory=$false)]
    [string]$t,
    
    [Parameter(Mandatory=$false)]
    [string]$p,
    
    [switch]$help
)

# Show help if requested or no arguments provided
if ($help -or (-not $s -and -not $t -and -not $p)) {
    Write-Host "Quick Site Handbook - Create Site Script" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage: .\create-site.ps1 -s <site-name> -t <theme-url> -p <parent-directory>" -ForegroundColor White
    Write-Host ""
    Write-Host "Parameters:" -ForegroundColor Yellow
    Write-Host "  -s    Site name (required)"
    Write-Host "  -t    Theme GitHub URL (required)"
    Write-Host "  -p    Parent directory path (required)"
    Write-Host "  -help Show this help message"
    Write-Host ""
    Write-Host "Example:" -ForegroundColor Green
    Write-Host "  .\create-site.ps1 -s myblog -t https://github.com/theNewDynamic/gohugo-theme-ananke.git -p C:\Websites"
    exit 0
}

# Validate arguments
if (-not $s -or -not $t -or -not $p) {
    Write-Host "❌ Error: Missing required arguments" -ForegroundColor Red
    Write-Host ""
    Write-Host "Usage: .\create-site.ps1 -s <site-name> -t <theme-url> -p <parent-directory>"
    Write-Host "Use -help for more information."
    exit 1
}

$SiteName = $s
$ThemeUrl = $t
$ParentDir = $p

# Extract theme name from URL
$ThemeName = [System.IO.Path]::GetFileNameWithoutExtension($ThemeUrl)

# Full path to site directory
$SiteDir = Join-Path $ParentDir $SiteName

Write-Host "🚀 Quick Site Handbook - Creating your Hugo site" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 Configuration:" -ForegroundColor Yellow
Write-Host "   Site name: $SiteName"
Write-Host "   Theme: $ThemeName"
Write-Host "   Location: $SiteDir"
Write-Host ""

# Check if directory already exists
if (Test-Path $SiteDir) {
    Write-Host "❌ Error: Directory already exists: $SiteDir" -ForegroundColor Red
    Write-Host "Please choose a different site name or remove the existing directory."
    exit 1
}

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
    Write-Host "   ✅ Pixi already installed" -ForegroundColor Green
}

# Create parent directory if it doesn't exist
Write-Host ""
Write-Host "📁 Creating site directory..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path $ParentDir | Out-Null
New-Item -ItemType Directory -Force -Path $SiteDir | Out-Null
Set-Location $SiteDir

# Initialize pixi project
Write-Host "🔄 Initializing Pixi environment..." -ForegroundColor Yellow
pixi init

# Install git and hugo
Write-Host "⬇️ Installing Git and Hugo..." -ForegroundColor Yellow
pixi add git hugo

Write-Host ""
Write-Host "🏗️ Creating Hugo site: $SiteName" -ForegroundColor Cyan
pixi run hugo new site . --force

# Initialize git
Write-Host "📚 Initializing Git repository..." -ForegroundColor Yellow
pixi run git init

# Add theme as submodule
Write-Host "🎨 Adding theme: $ThemeName" -ForegroundColor Yellow
pixi run git submodule add $ThemeUrl "themes/$ThemeName"

# Configure hugo.toml
Write-Host "⚙️ Configuring hugo.toml..." -ForegroundColor Yellow
$hugoConfig = @"
baseURL = 'https://example.org'
languageCode = 'en-us'
title = '$SiteName'
theme = '$ThemeName'
"@
$hugoConfig | Out-File -FilePath "hugo.toml" -Encoding UTF8

# Create README.md
Write-Host "📝 Creating README.md..." -ForegroundColor Yellow
$readmeContent = @"
# $SiteName

This is a Hugo website created with [Quick Site Handbook](https://quick-site-handbook.pages.dev/quick-site-handbook).

## Development

### Prerequisites

This project uses [Pixi](https://pixi.sh/) to manage dependencies.

### Available Commands

All commands should be run with ``pixi run``:

``````powershell
# Start development server
pixi run hugo server -D

# Create new content
pixi run hugo new content posts/hello.md

# Build the site
pixi run hugo
``````

### Project Structure

- ``content/`` - Website content (markdown files)
- ``themes/`` - Hugo themes
- ``static/`` - Static assets (images, CSS, JS)
- ``hugo.toml`` - Site configuration

## Deployment

This site is configured for deployment on Cloudflare Pages:

1. Push to GitHub
2. Connect repository to Cloudflare Pages
3. Select "Hugo" as the framework preset
4. Deploy!

## Theme

This site uses the [$ThemeName]($ThemeUrl) theme.

See the theme documentation for customization options.
"@
$readmeContent | Out-File -FilePath "README.md" -Encoding UTF8

# Create .gitignore
Write-Host "🚫 Creating .gitignore..." -ForegroundColor Yellow
$gitignoreContent = @"
# Generated files by Hugo
public/
resources/_gen/
.hugo_build.lock

# OS files
.DS_Store
Thumbs.db

# Editor files
.vscode/
.idea/
*.swp
*.swo
*~

# Pixi
.pixi/
pixi.lock
"@
$gitignoreContent | Out-File -FilePath ".gitignore" -Encoding UTF8

# Create a sample content file
New-Item -ItemType Directory -Force -Path "content\posts" | Out-Null
$dateStr = Get-Date -Format "yyyy-MM-ddTHH:mm:sszzz"
$helloContent = @"
---
title: "Hello World"
date: $dateStr
draft: false
---

Welcome to your new Hugo site!

## Next Steps

1. Edit this file at ``content/posts/hello.md``
2. Create new posts with ``pixi run hugo new content posts/my-post.md``
3. Start the development server with ``pixi run hugo server -D``
4. Visit http://localhost:1313 to preview your site

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Quick Site Handbook](https://quick-site-handbook.pages.dev/quick-site-handbook)
- [Theme Documentation]($ThemeUrl)
"@
$helloContent | Out-File -FilePath "content\posts\hello.md" -Encoding UTF8

Write-Host ""
Write-Host "✅ Site created successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "📂 Location: $SiteDir" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "   1. cd $SiteDir"
Write-Host "   2. pixi run hugo server -D    # Start dev server"
Write-Host "   3. Open http://localhost:1313"
Write-Host ""
Write-Host "To deploy:" -ForegroundColor Yellow
Write-Host "   1. Upload to GitHub using GitHub Desktop"
Write-Host "   2. Deploy to Cloudflare Pages"
Write-Host "   See: https://quick-site-handbook.pages.dev/quickstart"
Write-Host ""
