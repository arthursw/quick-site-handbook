---
title: Intermediate Guide
description: Install tools once, create unlimited Hugo sites.
---

This guide is for users who plan to create **multiple websites**. Instead of installing tools for each site, we'll install them once globally on your system.

## Quickstart vs Intermediate

| Approach | Best For | Setup Time |
|----------|----------|------------|
| **Quickstart** | One website, fastest setup | Each site reinstalls tools |
| **Intermediate** | Multiple websites | Install once, create many |

---

## What This Guide Covers

By the end, you will have:
- ✓ Installed Pixi, Git, and Hugo globally on your system
- ✓ Created your first site using the global tools
- ✓ Learned how to create additional sites quickly

---

## Prerequisites

Same as the Quickstart:
- **GitHub account**: [Sign up](https://github.com/join)
- **Cloudflare account**: [Sign up](https://dash.cloudflare.com/sign-up)
- **GitHub Desktop**: [Download](https://desktop.github.com/download/)
- **A Hugo theme**: [Browse themes](https://themes.gohugo.io/)

---

## Step 1: Install Tools Globally

First, we'll install the three tools you'll need: **Pixi** (package manager), **Git** (version control), and **Hugo** (site generator).

### Mac / Linux

Open Terminal and run:

```bash
curl -fsSL https://quick-site-handbook.pages.dev/quick-site-handbook/install-tools.sh | bash
```

### Windows

Open PowerShell and run:

```powershell
irm https://quick-site-handbook.pages.dev/quick-site-handbook/install-tools.ps1 | iex
```

:::details[What does this do?]
This script:
1. Checks if Pixi is installed (installs it if not)
2. Runs `pixi global install git` to install Git
3. Runs `pixi global install hugo` to install Hugo

These tools are now available system-wide, not just in one project folder.
:::

Wait for the installation to complete. You may need to restart your terminal/PowerShell when done.

---

## Step 2: Create Your First Site

Now that tools are installed, creating a site is much faster.

### Generate Your Command

Go to the [**Command Generator**](/quick-site-handbook/command-generator) and select:
- **Tab**: "Create Site Only" (not "Ultimate Command")
- Fill in your site name, theme URL, and folder path
- Copy the command

### Run the Command

**Mac / Linux** (Terminal):
```bash
# Paste the command from the generator
curl -fsSL https://quick-site-handbook.pages.dev/quick-site-handbook/new-site.sh | bash -s -- -s mysite -t https://github.com/theNewDynamic/gohugo-theme-ananke.git -p /path/to/sites
```

**Windows** (PowerShell):
```powershell
# Paste the command from the generator
irm https://quick-site-handbook.pages.dev/quick-site-handbook/new-site.ps1 | iex -s -- -s mysite -t https://github.com/theNewDynamic/gohugo-theme-ananke.git -p C:\path\to\sites
```

:::details[What does this do?]
This script:
1. Creates a new Hugo site with `hugo new site`
2. Initializes Git with `git init`
3. Adds your theme as a Git submodule
4. Configures `hugo.toml` with the theme name
5. Creates a helpful README.md and .gitignore
:::

---

## Step 3: Upload and Deploy

Follow the same steps as the Quickstart:

1. **Upload to GitHub** using GitHub Desktop
   - Add existing repository
   - Publish to GitHub

2. **Deploy on Cloudflare Pages**
   - Connect your GitHub repository
   - Select "Hugo" as the framework preset
   - Deploy!

See the [Quickstart Steps 4-5](/quick-site-handbook/quickstart#step-4-upload-to-github) for detailed instructions.

---

## Creating Additional Sites

Now that tools are installed globally, creating more sites is simple:

### Using the Command Generator

1. Go to the [**Command Generator**](/quick-site-handbook/command-generator)
2. Select "Create Site Only" tab
3. Fill in new site name, theme, and folder
4. Copy and run the command

### Manual Site Creation (Optional)

If you prefer to understand each step:

```bash
# Create a new site
hugo new site my-second-site
cd my-second-site

# Initialize git
git init

# Add a theme (replace with your theme URL)
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke

# Configure the theme
echo "theme = 'ananke'" >> hugo.toml

# Create a README
cat > README.md << 'EOF'
# My Second Site

## Development
- Edit content in `content/`
- Test locally: `hugo server -D`
- View at: http://localhost:1313

## Deployment
Changes pushed to GitHub automatically deploy to Cloudflare Pages.
EOF

# Create .gitignore
cat > .gitignore << 'EOF'
# Generated files
public/
resources/
.hugo_build.lock

# OS files
.DS_Store
Thumbs.db
EOF
```

---

## Managing Your Sites

### Listing Installed Tools

To see what versions you have:

```bash
# Check Hugo version
hugo version

# Check Git version
git --version

# Check Pixi version
pixi --version
```

### Updating Tools

To update to the latest versions:

```bash
# Update Hugo
pixi global upgrade hugo

# Update Git
pixi global upgrade git

# Update all global packages
pixi global upgrade-all
```

### Uninstalling Tools

If you need to remove the tools:

```bash
pixi global remove hugo
pixi global remove git
```

---

## Local Development (Optional)

With global installation, you can easily preview sites before pushing to GitHub:

```bash
# Navigate to your site folder
cd /path/to/your-site

# Start development server
hugo server -D

# Open http://localhost:1313 in your browser
```

- Edit files and see changes instantly
- Press `Ctrl+C` to stop the server
- The `-D` flag includes draft content

---

## Summary

**Global install advantages:**
- ✅ Create sites faster (no re-installation)
- ✅ Use development server (`hugo server`)
- ✅ Easier to manage and update tools
- ✅ Better for learning and experimentation

**When to use Quickstart instead:**
- You're only making one website ever
- You want the absolute simplest setup
- You don't want tools installed on your system

---

## Next Steps

- Learn more about [**Hugo**](https://gohugo.io/documentation/)
- Explore [**Hugo themes**](https://themes.gohugo.io/)
- Read the [**Manual Guide**](/quick-site-handbook/manual) for deeper understanding
- Join the [**Hugo community**](https://discourse.gohugo.io/)
