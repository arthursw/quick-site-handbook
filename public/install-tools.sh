#!/bin/bash

# Quick Site Handbook - Install Tools Script
# This script installs pixi, git, and hugo globally

set -e

echo "🚀 Quick Site Handbook - Installing Tools"
echo ""

# Install pixi if not present
echo "📦 Checking for Pixi..."
if ! command -v pixi &> /dev/null; then
    echo "   Pixi not found. Installing..."
    curl -fsSL https://pixi.sh/install.sh | bash
    
    # Source pixi for this session
    export PATH="$HOME/.pixi/bin:$PATH"
    
    if ! command -v pixi &> /dev/null; then
        echo "❌ Failed to install Pixi. Please install manually: https://pixi.sh"
        exit 1
    fi
    echo "   ✅ Pixi installed!"
else
    echo "   ✅ Pixi already installed ($(pixi --version))"
fi

echo ""
echo "⬇️ Installing Git globally..."
pixi global install git
echo "   ✅ Git installed!"

echo ""
echo "⬇️ Installing Hugo globally..."
pixi global install hugo
echo "   ✅ Hugo installed!"

echo ""
echo "✅ All tools installed successfully!"
echo ""
echo "Installed versions:"
echo "   $(pixi --version)"
echo "   $(git --version)"
echo "   $(hugo version | head -n1)"
echo ""
echo "You can now create sites using the 'Create Site Only' command."
echo "Visit: https://quick-site-handbook.pages.dev/command-generator"
echo ""
echo "⚠️  Note: You may need to restart your terminal for all tools to be available."
echo ""
