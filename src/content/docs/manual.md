---
title: Manual Guide
description: Learn the concepts and find resources for deeper understanding.
---

This guide provides context and resources for understanding how everything works. If you want to go beyond "copy and paste" and actually understand the tools, this is for you.

---

## What is a Static Website?

A **static website** is made of pre-built HTML files that are served to visitors exactly as stored. Unlike dynamic websites (like Facebook or Twitter), they don't generate pages on-the-fly from a database.

### Static vs Dynamic

| Static | Dynamic |
|--------|---------|
| Pre-built HTML files | Generated per request |
| Fast loading | Can be slower |
| Very secure | More attack vectors |
| Host anywhere | Needs server processing |
| Blogs, portfolios, docs | E-commerce, social media |

### Static Site Generators

Tools like **Hugo** take your content (written in Markdown) and templates, then generate a complete website. This handbook uses Hugo, but others include:

- [Jekyll](https://jekyllrb.com/) — Ruby-based, GitHub Pages native
- [Astro](https://astro.build/) — Modern, component-based (this site uses it!)
- [Gatsby](https://www.gatsbyjs.com/) — React-based
- [Eleventy](https://www.11ty.dev/) — Simple, flexible

**Learn more**:
- [What is a Static Site Generator?](https://www.cloudflare.com/learning/performance/static-site-generator/)
- [Jamstack.org](https://jamstack.org/)

---

## Command Line Basics

The command line (terminal, shell) is a text-based way to interact with your computer. The scripts in this handbook use it to automate tasks.

### Essential Commands

| Command | Description |
|---------|-------------|
| `pwd` | Print working directory (where you are) |
| `ls` (Mac/Linux) / `dir` (Windows) | List files in current folder |
| `cd foldername` | Change to a folder |
| `cd ..` | Go up one folder |
| `mkdir foldername` | Create a new folder |

### Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| ↑ / ↓ | Navigate command history |
| Ctrl+A | Go to start of line |
| Ctrl+E | Go to end of line |
| Option+← / Option+→ | Move word by word (Mac) |
| Ctrl+← / Ctrl+→ | Move word by word (Windows) |
| Ctrl+R | Search command history |
| Tab | Auto-complete filenames |

**Learn more**:
- [Command Line Crash Course](https://developer.mozilla.org/en-US/docs/Learn/Tools_and_testing/Understanding_client-side_tools/Command_line)
- [Terminal Cheat Sheet](https://terminalcheatsheet.com/)

---

## Git Fundamentals

**Git** is a version control system — it tracks changes to your files over time. **GitHub** is a website that hosts Git repositories online.

### Key Concepts

- **Repository (repo)**: A folder tracked by Git
- **Commit**: A snapshot of your files at a specific point
- **Push**: Upload your commits to GitHub
- **Pull**: Download changes from GitHub
- **Clone**: Download a complete repository

### Git vs GitHub Desktop

| Method | Best For |
|--------|----------|
| GitHub Desktop | Visual learners, simplicity |
| VS Code Source Control | Developers already using VS Code |
| Command line | Full control, automation |

**Learn more**:
- [Git - The Simple Guide](https://rogerdudler.github.io/git-guide/)
- [Oh Shit, Git!?](https://ohshitgit.com/) — Fixing common mistakes
- [Pro Git Book](https://git-scm.com/book/en/v2) — Comprehensive (free)

---

## VS Code for Local Development

**Visual Studio Code** is a free code editor that's excellent for working with Hugo sites locally.

### Benefits

- Live preview of Markdown
- Integrated terminal
- Git interface built-in
- Extensions for Hugo and Markdown

### Key Extensions

- **Markdown All in One** — Preview, shortcuts, TOC
- **YAML** — For front matter editing

**Learn more**:
- [VS Code Documentation](https://code.visualstudio.com/docs)
- [Hugo in VS Code](https://gohugo.io/tools/editors/#visual-studio-code)

---

## Hugo Deep Dive

### Directory Structure

```
your-site/
├── archetypes/      # Templates for new content
├── assets/          # Files processed by Hugo (SCSS, JS)
├── content/         # Your website content
├── data/            # Data files (JSON, YAML)
├── layouts/         # HTML templates
├── static/          # Files served directly (images, CSS)
├── themes/          # Your theme
└── hugo.toml        # Site configuration
```

### Configuration (hugo.toml)

```toml
baseURL = 'https://example.com'
languageCode = 'en-us'
title = 'My Site'
theme = 'ananke'

[params]
  author = 'Your Name'
  description = 'Site description'
```

### Content Format (Front Matter)

```markdown
---
title: "My Post"
date: 2024-01-01T12:00:00Z
draft: false
---

Your content here in **Markdown**.
```

**Learn more**:
- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Quick Start](https://gohugo.io/getting-started/quick-start/)
- [Hugo Themes](https://themes.gohugo.io/)

---

## Web Fundamentals

Understanding basic web technologies helps you customize your site.

### HTML (Structure)

HTML defines the structure of web pages.

```html
<h1>This is a heading</h1>
<p>This is a paragraph with <a href="link.html">a link</a>.</p>
<img src="photo.jpg" alt="Description">
```

### CSS (Styling)

CSS controls how your site looks.

```css
body {
  font-family: Arial, sans-serif;
  color: #333;
  max-width: 800px;
  margin: 0 auto;
}
```

### JavaScript (Interactivity)

JavaScript adds dynamic behavior (optional for static sites).

```javascript
console.log('Hello, world!');
document.querySelector('h1').style.color = 'blue';
```

**Learn more**:
- [MDN Web Docs](https://developer.mozilla.org/en-US/) — Comprehensive web documentation
- [freeCodeCamp](https://www.freecodecamp.org/) — Free coding courses
- [HTML.com](https://html.com/) — HTML guide

---

## Pixi Package Manager

**Pixi** is a package manager we use to install Git and Hugo. It's like an app store for command-line tools.

### Why Pixi?

- Cross-platform (Mac, Linux, Windows)
- No admin rights needed
- Isolated environments
- Easy to update and remove

### Common Commands

```bash
# Install a package globally
pixi global install hugo

# Update a package
pixi global upgrade hugo

# List installed packages
pixi global list

# Remove a package
pixi global remove hugo
```

**Learn more**:
- [Pixi Documentation](https://pixi.sh/)

---

## Cloudflare Pages

**Cloudflare Pages** hosts your static website for free and automatically deploys when you push changes to GitHub.

### How It Works

1. You push code to GitHub
2. Cloudflare detects the change
3. Cloudflare runs `hugo` to build your site
4. The built site is deployed to Cloudflare's global network

### Custom Domains

You can use your own domain name:

1. In Cloudflare Pages, go to **Custom domains**
2. Click **Set up a custom domain**
3. Enter your domain name
4. Follow the DNS configuration steps

**Learn more**:
- [Cloudflare Pages Docs](https://developers.cloudflare.com/pages/)

---

## Recommended Learning Path

1. **Get a site online first** — Follow the [Quickstart](/quickstart)
2. **Understand Git** — Learn the basics of version control
3. **Learn Markdown** — Essential for writing content
4. **Explore Hugo** — Understand themes and configuration
5. **Study HTML/CSS** — For customization

---

## External Resources

### Documentation
- [Hugo Docs](https://gohugo.io/documentation/)
- [GitHub Docs](https://docs.github.com/)
- [Cloudflare Docs](https://developers.cloudflare.com/)
- [MDN Web Docs](https://developer.mozilla.org/)

### Communities
- [Hugo Discourse](https://discourse.gohugo.io/)
- [GitHub Community](https://github.community/)
- [r/webdev](https://www.reddit.com/r/webdev/)

### Tools
- [Markdown Guide](https://www.markdownguide.org/)
- [Can I Use](https://caniuse.com/) — Browser compatibility
- [Coolors](https://coolors.co/) — Color palette generator
