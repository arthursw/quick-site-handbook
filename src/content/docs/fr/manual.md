---
title: Guide Manuel
description: Apprenez les concepts et trouvez des ressources pour une compréhension approfondie.
---

Ce guide fournit du contexte et des ressources pour comprendre comment tout fonctionne. Si vous voulez aller au-delà du "copier-coller" et comprendre réellement les outils, ceci est pour vous.

---

## Qu'est-ce qu'un Site Web Statique ?

Un **site web statique** est composé de fichiers HTML pré-construits qui sont servis aux visiteurs exactement tels quels. Contrairement aux sites web dynamiques (comme Facebook ou Twitter), ils ne génèrent pas de pages à la volée depuis une base de données.

### Statique vs Dynamique

| Statique | Dynamique |
|----------|-----------|
| Fichiers HTML pré-construits | Généré à chaque requête |
| Chargement rapide | Peut être plus lent |
| Très sécurisé | Plus de vecteurs d'attaque |
| Hébergeable n'importe où | Nécessite un traitement serveur |
| Blogs, portfolios, docs | E-commerce, réseaux sociaux |

### Générateurs de Sites Statiques

Des outils comme **Hugo** prennent votre contenu (écrit en Markdown) et des modèles, puis génèrent un site web complet. Ce guide utilise Hugo, mais d'autres existent :

- [Jekyll](https://jekyllrb.com/) — Basé sur Ruby, natif GitHub Pages
- [Astro](https://astro.build/) — Moderne, basé sur des composants (ce site l'utilise !)
- [Gatsby](https://www.gatsbyjs.com/) — Basé sur React
- [Eleventy](https://www.11ty.dev/) — Simple, flexible

**En savoir plus** :
- [Qu'est-ce qu'un Générateur de Site Statique ?](https://www.cloudflare.com/learning/performance/static-site-generator/) (EN)
- [Jamstack.org](https://jamstack.org/)

---

## Bases de la Ligne de Commande

La ligne de commande (terminal, shell) est un moyen textuel d'interagir avec votre ordinateur. Les scripts de ce guide l'utilisent pour automatiser les tâches.

### Commandes Essentielles

| Commande | Description |
|----------|-------------|
| `pwd` | Afficher le répertoire de travail (où vous êtes) |
| `ls` (Mac/Linux) / `dir` (Windows) | Lister les fichiers dans le dossier actuel |
| `cd nom-du-dossier` | Changer pour un dossier |
| `cd ..` | Remonter d'un dossier |
| `mkdir nom-du-dossier` | Créer un nouveau dossier |

### Raccourcis Clavier

| Raccourci | Action |
|-----------|--------|
| ↑ / ↓ | Naviguer dans l'historique des commandes |
| Ctrl+A | Aller au début de la ligne |
| Ctrl+E | Aller à la fin de la ligne |
| Option+← / Option+→ | Se déplacer mot par mot (Mac) |
| Ctrl+← / Ctrl+→ | Se déplacer mot par mot (Windows) |
| Ctrl+R | Rechercher dans l'historique |
| Tab | Auto-compléter les noms de fichiers |

**En savoir plus** :
- [Cours intensif sur la ligne de commande](https://developer.mozilla.org/en-US/docs/Learn/Tools_and_testing/Understanding_client-side_tools/Command_line) (EN)
- [Terminal Cheat Sheet](https://terminalcheatsheet.com/)

---

## Fondamentaux de Git

**Git** est un système de contrôle de version — il trace les modifications de vos fichiers au fil du temps. **GitHub** est un site web qui héberge des dépôts Git en ligne.

### Concepts Clés

- **Dépôt (repo)** : Un dossier suivi par Git
- **Commit** : Un instantané de vos fichiers à un moment précis
- **Push** : Télécharger vos commits sur GitHub
- **Pull** : Télécharger les modifications depuis GitHub
- **Clone** : Télécharger un dépôt complet

### Git vs GitHub Desktop

| Méthode | Idéal Pour |
|---------|------------|
| GitHub Desktop | Apprenants visuels, simplicité |
| VS Code Source Control | Développeurs utilisant déjà VS Code |
| Ligne de commande | Contrôle total, automatisation |

**En savoir plus** :
- [Git - Le Guide Simple](https://rogerdudler.github.io/git-guide/index-fr.html)
- [Oh Shit, Git!?](https://ohshitgit.com/fr) — Corriger les erreurs courantes
- [Pro Git Book](https://git-scm.com/book/fr/v2) — Complet (gratuit)

---

## VS Code pour le Développement Local

**Visual Studio Code** est un éditeur de code gratuit excellent pour travailler avec des sites Hugo localement.

### Avantages

- Aperçu en direct du Markdown
- Terminal intégré
- Interface Git intégrée
- Extensions pour Hugo et Markdown

### Extensions Clés

- **Markdown All in One** — Aperçu, raccourcis, table des matières
- **YAML** — Pour l'édition du front matter

**En savoir plus** :
- [Documentation VS Code](https://code.visualstudio.com/docs)
- [Hugo dans VS Code](https://gohugo.io/tools/editors/#visual-studio-code)

---

## Approfondissement Hugo

### Structure des Dossiers

```
votre-site/
├── archetypes/      # Modèles pour nouveau contenu
├── assets/          # Fichiers traités par Hugo (SCSS, JS)
├── content/         # Le contenu de votre site web
├── data/            # Fichiers de données (JSON, YAML)
├── layouts/         # Modèles HTML
├── static/          # Fichiers servis directement (images, CSS)
├── themes/          # Votre thème
└── hugo.toml        # Configuration du site
```

### Configuration (hugo.toml)

```toml
baseURL = 'https://example.com'
languageCode = 'fr-fr'
title = 'Mon Site'
theme = 'ananke'

[params]
  author = 'Votre Nom'
  description = 'Description du site'
```

### Format de Contenu (Front Matter)

```markdown
---
title: "Mon Article"
date: 2024-01-01T12:00:00Z
draft: false
---

Votre contenu ici en **Markdown**.
```

**En savoir plus** :
- [Documentation Hugo](https://gohugo.io/documentation/)
- [Démarrage Rapide Hugo](https://gohugo.io/getting-started/quick-start/)
- [Thèmes Hugo](https://themes.gohugo.io/)

---

## Fondamentaux du Web

Comprendre les technologies web de base vous aide à personnaliser votre site.

### HTML (Structure)

Le HTML définit la structure des pages web.

```html
<h1>Ceci est un titre</h1>
<p>Ceci est un paragraphe avec <a href="lien.html">un lien</a>.</p>
<img src="photo.jpg" alt="Description">
```

### CSS (Style)

Le CSS contrôle l'apparence de votre site.

```css
body {
  font-family: Arial, sans-serif;
  color: #333;
  max-width: 800px;
  margin: 0 auto;
}
```

### JavaScript (Interactivité)

JavaScript ajoute un comportement dynamique (optionnel pour les sites statiques).

```javascript
console.log('Bonjour le monde !');
document.querySelector('h1').style.color = 'blue';
```

**En savoir plus** :
- [MDN Web Docs](https://developer.mozilla.org/fr/) — Documentation web complète
- [freeCodeCamp](https://www.freecodecamp.org/) — Cours de programmation gratuits
- [OpenClassrooms](https://openclassrooms.com/) — Cours en français

---

## Gestionnaire de Paquets Pixi

**Pixi** est un gestionnaire de paquets que nous utilisons pour installer Git et Hugo. C'est comme un magasin d'applications pour les outils en ligne de commande.

### Pourquoi Pixi ?

- Multiplateforme (Mac, Linux, Windows)
- Pas besoin de droits administrateur
- Environnements isolés
- Facile à mettre à jour et supprimer

### Commandes Courantes

```bash
# Installer un paquet globalement
pixi global install hugo

# Mettre à jour un paquet
pixi global upgrade hugo

# Lister les paquets installés
pixi global list

# Supprimer un paquet
pixi global remove hugo
```

**En savoir plus** :
- [Documentation Pixi](https://pixi.sh/)

---

## Cloudflare Pages

**Cloudflare Pages** héberge votre site web statique gratuitement et déploie automatiquement lorsque vous poussez des modifications sur GitHub.

### Comment Ça Marche

1. Vous poussez du code sur GitHub
2. Cloudflare détecte le changement
3. Cloudflare exécute `hugo` pour construire votre site
4. Le site construit est déployé sur le réseau mondial de Cloudflare

### Domaines Personnalisés

Vous pouvez utiliser votre propre nom de domaine :

1. Dans Cloudflare Pages, allez sur **Custom domains**
2. Cliquez sur **Set up a custom domain**
3. Entrez votre nom de domaine
4. Suivez les étapes de configuration DNS

**En savoir plus** :
- [Documentation Cloudflare Pages](https://developers.cloudflare.com/pages/)

---

## Parcours d'Apprentissage Recommandé

1. **Mettez d'abord un site en ligne** — Suivez le [Démarrage Rapide](/quick-site-handbook/fr/quickstart)
2. **Comprenez Git** — Apprenez les bases du contrôle de version
3. **Apprenez le Markdown** — Essentiel pour écrire du contenu
4. **Explorez Hugo** — Comprenez les thèmes et la configuration
5. **Étudiez le HTML/CSS** — Pour la personnalisation

---

## Ressources Externes

### Documentation
- [Documentation Hugo](https://gohugo.io/documentation/)
- [Documentation GitHub](https://docs.github.com/fr)
- [Documentation Cloudflare](https://developers.cloudflare.com/)
- [MDN Web Docs](https://developer.mozilla.org/fr/)

### Communautés
- [Hugo Discourse](https://discourse.gohugo.io/)
- [Communauté GitHub](https://github.community/)
- [r/webdev](https://www.reddit.com/r/webdev/)

### Outils
- [Guide Markdown](https://www.markdownguide.org/)
- [Can I Use](https://caniuse.com/) — Compatibilité navigateurs
- [Coolors](https://coolors.co/) — Générateur de palettes de couleurs
