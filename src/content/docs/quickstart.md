---
title: Quickstart
description: Get your static website online in minutes with a single command.
---

This guide will take you from zero to a live website in the fastest way possible. No coding knowledge required — just copy, paste, and follow the steps.

## What you'll accomplish

By the end of this guide, you will have:
- ✓ Created a Hugo website with a theme of your choice
- ✓ Uploaded it to GitHub
- ✓ Deployed it to Cloudflare Pages (with a free URL)
- ✓ Learned how to edit your content

---

## Step 1: Prerequisites

Before we start, you need two free accounts:

1. **A GitHub account** — [Sign up here](https://github.com/join)
   - This is where your website's code will be stored

2. **A Cloudflare account** — [Sign up here](https://dash.cloudflare.com/sign-up)
   - This is where your website will be hosted and published

3. **Download GitHub Desktop**
   - [Download for Mac](https://desktop.github.com/download/)
   - [Download for Windows](https://desktop.github.com/download/)
   - This tool makes it easy to upload your site without using the command line

4. **Choose a Hugo theme**
   - Browse themes at [themes.gohugo.io](https://themes.gohugo.io/)
   - Find one you like and copy its GitHub URL (click the theme, then click the GitHub link, then copy the URL from your browser)

---

## Step 2: Get Your Command

Go to the [**Command Generator**](/command-generator) page to create your custom installation command.

You'll need to provide:
- **Site name**: A name for your website (no spaces, lowercase recommended)
- **Theme URL**: The GitHub URL you copied in Step 1
- **Folder path**: Where you want the site saved on your computer

The generator will show you the command to run. Click the copy button.

:::tip[How to copy a folder path]
- **Mac**: Right-click the folder → Hold Option → Click "Copy as Pathname"
- **Windows**: Shift + Right-click the folder → "Copy as path"
- **Linux**: Right-click the folder → "Copy" or use Ctrl+Shift+C in the terminal
:::

---

## Step 3: Create Your Site

Now you'll run the command to create your website.

### Mac / Linux

1. Open **Terminal** (you can find it in Applications → Utilities)
2. Paste the command you copied (Cmd+V)
3. Press **Enter** to run it

### Windows

1. Open **PowerShell** (press Windows key, type "PowerShell", press Enter)
2. Paste the command you copied (Ctrl+V)
3. Press **Enter** to run it

:::tip[How to paste in terminal]
- **Mac Terminal**: Cmd+V
- **Windows PowerShell**: Right-click to paste
- **Linux Terminal**: Ctrl+Shift+V
:::

The script will:
- Install necessary tools (Pixi, Git, Hugo)
- Create your Hugo site with the chosen theme
- Set up a README and .gitignore file

Wait for it to complete. This may take a few minutes.

---

## Step 4: Upload to GitHub

Now let's put your site on GitHub so Cloudflare can access it.

1. **Open GitHub Desktop**

2. **Add your site folder**
   - Click "Add an Existing Repository from your Hard Drive..."
   - Select your site folder (the one you specified in the command generator)
   - Click "Add Repository"

3. **Publish to GitHub**
   - You'll see a "Publish repository" button — click it
   - Give your repository a name (usually the same as your site name)
   - Make sure "Keep this code private" is **unchecked** (Cloudflare needs to access it)
   - Click "Publish Repository"

4. **View on GitHub**
   - Click "View on GitHub" to see your repository online

Your code is now on GitHub! 🎉

---

## Step 5: Deploy on Cloudflare Pages

Now let's make your website live!

1. **Go to Cloudflare**
   - Visit [dash.cloudflare.com](https://dash.cloudflare.com) and sign in
   - Or go directly to [dash.cloudflare.com/?to=/:account/workers-and-pages](https://dash.cloudflare.com/?to=/:account/workers-and-pages)

2. **Create a Pages project**
   - Click "Create application"
   - Scroll down to "Looking to deploy Pages?" and click **Get started**

3. **Connect to GitHub**
   - Click "Connect to GitHub"
   - Authorize Cloudflare if prompted
   - Select your site repository from the list
   - Click "Begin setup"

4. **Configure build settings**
   - **Project name**: Can be anything (your-site-name)
   - **Production branch**: main
   - **Framework preset**: Select **Hugo** from the dropdown
   - Leave all other settings as default

5. **Deploy**
   - Click "Save and Deploy"
   - Wait for the build to complete (1-2 minutes)

6. **Visit your site**
   - You'll get a URL like `your-site-name.pages.dev`
   - Click it to see your live website!

🎉 **Your website is now live!**

---

## Step 6: Modify Your Content

Let's learn how to edit your website.

### Edit with GitHub.dev

The easiest way to edit your site is using **github.dev** — a free online code editor that works directly with your repository.

1. Go to your repository on GitHub
2. Press the **period key (.)** on your keyboard
   - This opens the github.dev editor in your browser
3. The editor looks like a simplified [Visual Studio Code](https://code.visualstudio.com/) with a file explorer on the left
4. Navigate to the `content/` folder (or where your theme stores content)
5. Click on the file you want to edit (usually `.md` files)
6. Make your changes in the editor
7. Press **Cmd+S (Mac)** or **Ctrl+S (Windows/Linux)** to save
8. Click the **Source Control** icon in the left sidebar (looks like a branch icon)
9. Add a commit message (e.g., "Updated homepage")
10. Click "Commit & Push"

Cloudflare will automatically rebuild your site. Wait 1-2 minutes, then refresh your live site.

:::tip[Quick edit on GitHub directly]
You can also edit files directly on GitHub without github.dev:
1. Go to your repository and find the file
2. Click the pencil icon (✏️) to edit
3. Make changes and click "Commit changes..."

This works for quick fixes, but github.dev is more user-friendly for regular editing with its file explorer and better editing interface.
:::

### Add a New Page

1. In github.dev (press `.` on your repository page), navigate to the content folder
2. Right-click in the file explorer → "New File"
3. Name it something like `my-new-page.md`
4. Add this at the top:
   ```yaml
   ---
   title: "My New Page"
   ---
   ```
5. Write your content below in Markdown
6. Save (Cmd+S / Ctrl+S)
7. Commit your changes via the Source Control panel

### Add Images

1. First, upload images using GitHub's web interface:
   - Go to your repository on GitHub (not github.dev)
   - Navigate to the `static/` or `assets/` folder
   - Click "Add file" → "Upload files"
   - Drag and drop your images and commit
2. Reference images in your content using `![Alt text](image-name.jpg)`

---

## Step 7: To Go Further

You've got the basics down! Here's what you can explore next:

### If you want to create more sites...

Check out the [**Intermediate Guide**](/intermediate) — it installs the tools globally so you can create unlimited sites without reinstalling everything.

### If you want to understand how it all works...

Visit the [**Manual Guide**](/manual) for resources on:
- How static websites work
- Command line basics
- Git fundamentals
- Hugo themes and customization
- HTML/CSS basics

### Common next steps

- **Add a custom domain**: In Cloudflare Pages, go to "Custom domains" and follow the setup
- **Customize your theme**: Edit the `hugo.toml` file in your repository
- **Learn Markdown**: The simple format for writing content — [Markdown Guide](https://www.markdownguide.org/)
- **Join the Hugo community**: [Hugo Discourse](https://discourse.gohugo.io/)

---

## Need Help?

If something didn't work:

1. Check the [**Manual Guide**](/manual) for detailed explanations
2. Search for your error message online
3. Check the [Hugo documentation](https://gohugo.io/documentation/)
4. Ask in the [Hugo community forum](https://discourse.gohugo.io/)

Good luck with your website! 🚀
