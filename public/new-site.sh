#!/bin/bash

# Quick Site Handbook - New Site Script
# This script creates a new Hugo site (assumes git and hugo are already installed)

set -e

# Parse arguments
SITE_NAME=""
THEME_URL=""
PARENT_DIR=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -s|--site)
            SITE_NAME="$2"
            shift 2
            ;;
        -t|--theme)
            THEME_URL="$2"
            shift 2
            ;;
        -p|--path)
            PARENT_DIR="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 -s <site-name> -t <theme-url> -p <parent-directory>"
            echo ""
            echo "Options:"
            echo "  -s, --site    Site name (required)"
            echo "  -t, --theme   Theme GitHub URL (required)"
            echo "  -p, --path    Parent directory path (required)"
            echo "  -h, --help    Show this help message"
            echo ""
            echo "Prerequisite: Git and Hugo must be installed (run install-tools.sh first)"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Validate arguments
if [[ -z "$SITE_NAME" ]] || [[ -z "$THEME_URL" ]] || [[ -z "$PARENT_DIR" ]]; then
    echo "❌ Error: Missing required arguments"
    echo ""
    echo "Usage: $0 -s <site-name> -t <theme-url> -p <parent-directory>"
    echo ""
    echo "Example:"
    echo "  $0 -s myblog -t https://github.com/theNewDynamic/gohugo-theme-ananke.git -p ~/websites"
    exit 1
fi

# Check prerequisites
echo "🔍 Checking prerequisites..."

if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please run the install-tools.sh script first."
    echo "   Visit: https://arthursw.github.io/quick-site-handbook/command-generator"
    exit 1
fi

if ! command -v hugo &> /dev/null; then
    echo "❌ Hugo is not installed. Please run the install-tools.sh script first."
    echo "   Visit: https://arthursw.github.io/quick-site-handbook/command-generator"
    exit 1
fi

echo "   ✅ Git: $(git --version)"
echo "   ✅ Hugo: $(hugo version | head -n1)"

# Extract theme name from URL
THEME_NAME=$(basename "$THEME_URL" .git)

# Full path to site directory
SITE_DIR="$PARENT_DIR/$SITE_NAME"

echo ""
echo "🚀 Quick Site Handbook - Creating your Hugo site"
echo ""
echo "📋 Configuration:"
echo "   Site name: $SITE_NAME"
echo "   Theme: $THEME_NAME"
echo "   Location: $SITE_DIR"
echo ""

# Check if directory already exists
if [[ -d "$SITE_DIR" ]]; then
    echo "❌ Error: Directory already exists: $SITE_DIR"
    echo "Please choose a different site name or remove the existing directory."
    exit 1
fi

# Create parent directory if it doesn't exist
echo "📁 Creating site directory..."
mkdir -p "$PARENT_DIR"

# Create Hugo site
echo "🏗️ Creating Hugo site: $SITE_NAME"
cd "$PARENT_DIR"
hugo new site "$SITE_NAME"
cd "$SITE_DIR"

# Initialize git
echo "📚 Initializing Git repository..."
git init

# Add theme as submodule
echo "🎨 Adding theme: $THEME_NAME"
git submodule add "$THEME_URL" "themes/$THEME_NAME"

# Configure hugo.toml
echo "⚙️ Configuring hugo.toml..."
cat > hugo.toml << EOF
baseURL = 'https://example.org'
languageCode = 'en-us'
title = '$SITE_NAME'
theme = '$THEME_NAME'
EOF

# Create README.md
echo "📝 Creating README.md..."
cat > README.md << EOF
# $SITE_NAME

This is a Hugo website created with [Quick Site Handbook](https://arthursw.github.io/quick-site-handbook).

## Development

### Prerequisites

- [Git](https://git-scm.com/)
- [Hugo](https://gohugo.io/)

### Available Commands

\`\`\`bash
# Start development server
hugo server -D

# Create new content
hugo new content posts/hello.md

# Build the site
hugo
\`\`\`

### Project Structure

- \`content/\` - Website content (markdown files)
- \`themes/\` - Hugo themes
- \`static/\` - Static assets (images, CSS, JS)
- \`hugo.toml\` - Site configuration

## Deployment

This site is configured for deployment on Cloudflare Pages:

1. Push to GitHub
2. Connect repository to Cloudflare Pages
3. Select "Hugo" as the framework preset
4. Deploy!

## Theme

This site uses the [$THEME_NAME]($THEME_URL) theme.

See the theme documentation for customization options.
EOF

# Create .gitignore
echo "🚫 Creating .gitignore..."
cat > .gitignore << EOF
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
EOF

# Create a sample content file
mkdir -p content/posts
cat > content/posts/hello.md << EOF
---
title: "Hello World"
date: $(date +%Y-%m-%dT%H:%M:%S%z)
draft: false
---

Welcome to your new Hugo site!

## Next Steps

1. Edit this file at \`content/posts/hello.md\`
2. Create new posts with \`hugo new content posts/my-post.md\`
3. Start the development server with \`hugo server -D\`
4. Visit http://localhost:1313 to preview your site

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Quick Site Handbook](https://arthursw.github.io/quick-site-handbook)
- [Theme Documentation]($THEME_URL)
EOF

echo ""
echo "✅ Site created successfully!"
echo ""
echo "📂 Location: $SITE_DIR"
echo ""
echo "Next steps:"
echo "   1. cd $SITE_DIR"
echo "   2. hugo server -D    # Start dev server"
echo "   3. Open http://localhost:1313"
echo ""
echo "To deploy:"
echo "   1. Upload to GitHub using GitHub Desktop"
echo "   2. Deploy to Cloudflare Pages"
echo "   See: https://arthursw.github.io/quick-site-handbook/quickstart"
echo ""
