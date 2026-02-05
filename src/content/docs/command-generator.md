---
title: Command Generator
description: Generate custom commands to create your Hugo website.
---

The Command Generator is a web tool that creates the exact command you need to run in your terminal or PowerShell.

:::tip[Open the Generator]
👉 [**Open Command Generator**](/command-generator)
:::

---

## How It Works

The generator asks for a few details, then creates a command you can copy and paste. No need to type long commands manually!

---

## Available Commands

### 1. The Ultimate Command (Beginners)

**Best for**: First-time users who want everything done automatically.

This single command will:
- Install Pixi (if not present)
- Install Git and Hugo
- Create your Hugo site
- Add your chosen theme
- Set up README and .gitignore

**What you need**:
- Site name (letters, numbers, hyphens only)
- Theme GitHub URL
- Folder path where you want the site

### 2. Install Tools Only

**Best for**: Users following the [Intermediate Guide](/intermediate).

Installs Pixi, Git, and Hugo globally so you can create multiple sites.

Run this once, then use "Create Site Only" for each new site.

### 3. Create Site Only

**Best for**: Users who already installed tools globally.

Creates a new Hugo site assuming Git and Hugo are already available on your system.

---

## Finding Your Theme URL

1. Go to [themes.gohugo.io](https://themes.gohugo.io/)
2. Browse and select a theme you like
3. Click the theme's **Demo** button to preview it
4. Click the **Download** button or look for a GitHub link
5. Copy the URL from your browser's address bar
   - It should look like: `https://github.com/username/theme-name`

---

## Getting the Folder Path

### Mac

1. Open **Finder**
2. Navigate to where you want your site folder
3. **Right-click** the folder
4. Hold **Option** key
5. Click **"Copy as Pathname"**

### Windows

1. Open **File Explorer**
2. Navigate to where you want your site folder
3. **Shift + Right-click** the folder
4. Click **"Copy as path"**

### Linux

1. Open your file manager
2. Navigate to the parent folder
3. **Right-click** → "Properties" to see the path
4. Or in terminal: `pwd` to print current path

---

## Platform Selection

The generator shows different commands for:

- **Mac / Linux**: Uses `bash` scripts with `curl`
- **Windows**: Uses PowerShell scripts with `irm`

Make sure to select the correct tab before copying!

---

## After Running the Command

Once your site is created:

1. **Upload to GitHub** using [GitHub Desktop](https://desktop.github.com/)
2. **Deploy to Cloudflare** following the [Quickstart guide](/quickstart#step-5-deploy-on-cloudflare-pages)
3. **Edit your content** using GitHub's online editor or VS Code

---

## Troubleshooting

### "Command not found"

- Make sure you copied the entire command
- On Windows, ensure you're using PowerShell (not Command Prompt)
- Try restarting your terminal

### Permission denied (Mac/Linux)

You may need to make the script executable:
```bash
chmod +x script-name.sh
```

### Script won't run (Windows)

You may need to change execution policy:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## Security Note

These scripts download and execute code from this website. Always review scripts before running them if you're unsure. The scripts are open source and available in our [GitHub repository](https://github.com/arthursw/tree/main/public).
