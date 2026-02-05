# Quickstart

The goal of the quick-site-handbook is to explain how to deploy a static website (Hugo or other) on Github and CloudFlare for those who have no knowledge of software development.

The repo will provide instructions (handbook) and startup scripts.

One quickstart guide which just explains the most simple commands to start, which will use the repo startup scripts.

One manual guide which explains how to setup things manually.

For those who only want to create one site and don't want to learn:

one script which:
- install pixi if necessary, 
- use it to create an env in the given folder path 
- install git and hugo
- creates a hugo site from the given site name and hugo theme (git url)
- creates a Readme.md (which explains basic site management) and .gitignore (ignore .DS_Store, public/ and files which should not be versionned)

For those who might want to create multiple sites and/or want to learn:

one script which:
- install pixi if necessary 
- install git and hugo globally (`pixi global install git`, `pixi global install hugo`)

one script which:
- creates a hugo site from the given site name and hugo theme
- creates a Readme.md (which explains basic site management) and .gitignore

One webpage with inputs to generates the command line to enter in your terminal/powershell to use those scripts.

The repo will be published on https://arthursw.github.io/quick-site-handbook so the command to run the scripts will look like `curl -fsSL https://arthursw.github.io/quick-site-handbook/create-site.sh | bash -s -- -s mysite -t ananke -p path/to/site/dir/`

The handbook must be for linux, mac and windows (powershell).

The handbook will be in multiple languages, English and French for now (use starlight i18n).


# Quickstart guide

## 1. Prerequisites

Create:
1. **A GitHub account** - [Sign up here](https://github.com/join)
2. **A CloudFlare account** - [Sign up here](https://dash.cloudflare.com/sign-up)

Download Github Desktop.
Choose your [Hugo theme](https://themes.gohugo.io/) and copy its github link (explain how).

## 2. Get your command

Go to https://arthursw.github.io/quick-site-handbook/command_generator.html to generate your site in one command.
Choose your settings (folder path, site, name) and copy the command (copy button).
A helpbox which explains how to copy the folder path on the different platform.

## 3. Create your site

Mac / Linux: open a terminal: go to ...
Windows: open a powershell: go to ...

Paste the command (helpbox to explain how to paste on the different platforms) and run it.

## 4. Upload to Github

Explain step by step: Use Github Desktop to select the site folder, create a git repo and push it to github.
Link to Github repo.

## 5. Deploy on Cloudflare Pages

Explain step by step: 

    https://dash.cloudflare.com/?to=/:account/workers-and-pages
    Click to Create application > at the botton "Looking to deploy Pages? [Get started](click here)" 

    Import an existing Git repository [Get started]

    Github > add account or choose account > select the site repository > Begin setup

    Let default

    Framework preset > Hugo

    Save and Deploy

    To add a domain name:
    Add Custom Domain > Set up a custom domain > etc.

## 6. Modify content

Explain the basics of Hugo to create and modify content with Github VSCode: add/edit markdown, add images, commit. See changes.

## 7. To go further

Tell about the other manuals.

# Command generator web page

Explain what is this page for.

Explain that the beginner who don't want to learn should use the ultimate command (find a name for that) and other use second and third commands.

## The ultimate command

Inputs: 
- site name, 
- hugo theme git url (explain how to find and copy it), 
- folder path (explain how to copy it on all platforms)

Copy generated command button.

Tooltip (collapsable?) explain what the command does with a link to the script.

---


## Install pixi, git and hugo

Copy command button.

Tooltip (collapsable?) explain what the command does with a link to the script.

## Create a website (git and hugo must be installed)

Inputs: 
- site name, 
- hugo theme git url (explain how to find and copy it), 
- folder path (explain how to copy it on all platforms)

Copy generated command button.

Tooltip (collapsable?) explain what the command does with a link to the script.

# Intermediate guide

Explain: Same as Quickstart guide but this time the script installs git and hugo globally so that the user can create multiple sites (without having to reinstall them).

Explain what do the scritps.

# Manual guides

The handbook will cover those topics:
- what is a static site vs dynamic site (link to nice docs, Hugo and others)
- how to use the command line (all platforms, explain shortcuts to make it usable, up/down arrows, copy paste, ctrl a, ctrl e, option arrow, etc.) (link to nice docs)
- how to install and use vs code (optional, alternative to Github VSCode, useful to code locally and develop/create/see changes faster)
- how to use git (optional, alternative to Github Desktop, explain the implications, complexity, power, and the VSCode Source Control alternative)
- the scripts step by step.
- how to edit site locally, run dev server
- how to commit, push, see results
- how to install hogu themes
- basic html, javascript and css
- how to modify them

Think about the plan of the handbook: which topics should be treated together and which should have a separate pages.




A few commands for this:
```
curl -fsSL https://pixi.sh/install.sh | sh
powershell -ExecutionPolicy Bypass -c "irm -useb https://pixi.sh/install.ps1 | iex"

pixi add hugo
pixi add git

pixi run hugo new site {sitename}
cd {sitename}
pixi run git init
pixi run git submodule add {theme_git_url} themes/{theme_name}   // theme_name is the last part of the URL (without the .git)
echo "theme = '{theme_name}'" >> hugo.toml

# create .gitignore and ignore the public/ folder (it will be built on Cloudflare) and any other file which should not be versioned

```
