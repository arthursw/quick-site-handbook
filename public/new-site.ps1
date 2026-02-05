# Quick Site Handbook - New Site Script
# This script creates a new Hugo site (assumes git and hugo are already installed)

param(
    [Parameter(Mandatory=$false)]
    [string]$s,
    
    [Parameter(Mandatory=$false)]
    [string]$t,
    
    [Parameter(Mandatory=$false)]
    [string]$p,
    
    [switch]$help
)

# Show help if requested
if ($help) {
    Write-Host "Quick Site Handbook - New Site Script" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage: .\new-site.ps1 -s <site-name> -t <theme-url> -p <parent-directory>" -ForegroundColor White
    Write-Host ""
    Write-Host "Parameters:" -ForegroundColor Yellow
    Write-Host "  -s    Site name (required)"
    Write-Host "  -t    Theme GitHub URL (required)"
    Write-Host "  -p    Parent directory path (required)"
    Write-Host "  -help Show this help message"
    Write-Host ""
    Write-Host "Prerequisite: Git and Hugo must be installed (run install-tools.ps1 first)" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "Example:" -ForegroundColor Green
    Write-Host "  .\new-site.ps1 -s myblog -t https://github.com/theNewDynamic/gohugo-theme-ananke.git -p C:\Websites"
    exit 0
}

# Validate arguments
if (-not $s -or -not $t -or -not $p) {
    Write-Host "❌ Error: Missing required arguments" -ForegroundColor Red
    Write-Host ""
    Write-Host "Usage: .\new-site.ps1 -s <site-name> -t <theme-url> -p <parent-directory>"
    Write-Host "Use -help for more information."
    exit 1
}

$SiteName = $s
$ThemeUrl = $t
$ParentDir = $p

# Check prerequisites
Write-Host "🔍 Checking prerequisites..." -ForegroundColor Yellow

$GitInstalled = $false
try {
    $null = Get-Command git -ErrorAction Stop
    $GitInstalled = $true
} catch {}

$HugoInstalled = $false
try {
    $null = Get-Command hugo -ErrorAction Stop
    $HugoInstalled = $true
} catch {}

if (-not $GitInstalled) {
    Write-Host "❌ Git is not installed. Please run the install-tools.ps1 script first." -ForegroundColor Red
    Write-Host "   Visit: https://quick-site-handbook.pages.dev/quick-site-handbook/command-generator"
    exit 1
}

if (-not $HugoInstalled) {
    Write-Host "❌ Hugo is not installed. Please run the install-tools.ps1 script first." -ForegroundColor Red
    Write-Host "   Visit: https://quick-site-handbook.pages.dev/quick-site-handbook/command-generator"
    exit 1
}

$gitVersion = git --version
$hugoVersion = hugo version
Write-Host "   ✅ Git: $gitVersion" -ForegroundColor Green
Write-Host "   ✅ Hugo: $hugoVersion" -ForegroundColor Green

# Extract theme name from URL
$ThemeName = [System.IO.Path]::GetFileNameWithoutExtension($ThemeUrl)

# Full path to site directory
$SiteDir = Join-Path $ParentDir $SiteName

Write-Host ""
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

# Create parent directory if it doesn't exist
Write-Host "📁 Creating site directory..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path $ParentDir | Out-Null

# Create Hugo site
Write-Host "🏗️ Creating Hugo site: $SiteName" -ForegroundColor Cyan
Set-Location $ParentDir
hugo new site $SiteName
Set-Location $SiteDir

# Initialize git
Write-Host "📚 Initializing Git repository..." -ForegroundColor Yellow
git init

# Add theme as submodule
Write-Host "🎨 Adding theme: $ThemeName" -ForegroundColor Yellow
git submodule add $ThemeUrl "themes/$ThemeName"

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

- [Git](https://git-scm.com/)
- [Hugo](https://gohugo.io/)

### Available Commands

``````powershell
# Start development server
hugo server -D

# Create new content
hugo new content posts/hello.md

# Build the site
hugo
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
2. Create new posts with ``hugo new content posts/my-post.md``
3. Start the development server with ``hugo server -D``
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
Write-Host "   2. hugo server -D    # Start dev server"
Write-Host "   3. Open http://localhost:1313"
Write-Host ""
Write-Host "To deploy:" -ForegroundColor Yellow
Write-Host "   1. Upload to GitHub using GitHub Desktop"
Write-Host "   2. Deploy to Cloudflare Pages"
Write-Host "   See: https://quick-site-handbook.pages.dev/quick-site-handbook/quickstart"
Write-Host ""
