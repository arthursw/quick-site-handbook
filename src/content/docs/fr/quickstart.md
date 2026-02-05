---
title: Démarrage Rapide
description: Mettez votre site web statique en ligne en quelques minutes avec une seule commande.
---

Ce guide vous mènera de zéro à un site web en ligne de la manière la plus rapide possible. Aucune connaissance en programmation requise — il suffit de copier, coller et suivre les étapes.

## Ce que vous allez accomplir

À la fin de ce guide, vous aurez :
- ✓ Créé un site Hugo avec le thème de votre choix
- ✓ Téléchargé le site sur GitHub
- ✓ Déployé le site sur Cloudflare Pages (avec une URL gratuite)
- ✓ Appris à modifier votre contenu

---

## Étape 1 : Prérequis

Avant de commencer, vous avez besoin de deux comptes gratuits :

1. **Un compte GitHub** — [Inscrivez-vous ici](https://github.com/join)
   - C'est là que le code de votre site web sera stocké

2. **Un compte Cloudflare** — [Inscrivez-vous ici](https://dash.cloudflare.com/sign-up)
   - C'est là que votre site web sera hébergé et publié

3. **Télécharger GitHub Desktop**
   - [Télécharger pour Mac](https://desktop.github.com/download/)
   - [Télécharger pour Windows](https://desktop.github.com/download/)
   - Cet outil facilite le téléchargement de votre site sans utiliser la ligne de commande

4. **Choisir un thème Hugo**
   - Parcourez les thèmes sur [themes.gohugo.io](https://themes.gohugo.io/)
   - Trouvez celui qui vous plaît et copiez son URL GitHub (cliquez sur le thème, puis sur le lien GitHub, puis copiez l'URL de votre navigateur)

---

## Étape 2 : Obtenir Votre Commande

Allez sur la page [**Générateur de Commandes**](/quick-site-handbook/fr/command-generator) pour créer votre commande d'installation personnalisée.

Vous devrez fournir :
- **Nom du site** : Un nom pour votre site web (pas d'espaces, minuscules recommandées)
- **URL du thème** : L'URL GitHub que vous avez copiée à l'étape 1
- **Chemin du dossier** : Où vous souhaitez enregistrer le site sur votre ordinateur

Le générateur vous montrera la commande à exécuter. Cliquez sur le bouton de copie.

:::tip[Comment copier le chemin d'un dossier]
- **Mac** : Clic droit sur le dossier → Maintenez Option → Cliquez sur "Copier le chemin d'accès"
- **Windows** : Maj + Clic droit sur le dossier → "Copier en tant que chemin d'accès"
- **Linux** : Clic droit sur le dossier → "Copier" ou utilisez Ctrl+Maj+C dans le terminal
:::

---

## Étape 3 : Créer Votre Site

Maintenant, vous allez exécuter la commande pour créer votre site web.

### Mac / Linux

1. Ouvrez le **Terminal** (vous le trouverez dans Applications → Utilitaires)
2. Collez la commande que vous avez copiée (Cmd+V)
3. Appuyez sur **Entrée** pour l'exécuter

### Windows

1. Ouvrez **PowerShell** (appuyez sur la touche Windows, tapez "PowerShell", appuyez sur Entrée)
2. Collez la commande que vous avez copiée (Ctrl+V)
3. Appuyez sur **Entrée** pour l'exécuter

:::tip[Comment coller dans le terminal]
- **Terminal Mac** : Cmd+V
- **PowerShell Windows** : Clic droit pour coller
- **Terminal Linux** : Ctrl+Maj+V
:::

Le script va :
- Installer les outils nécessaires (Pixi, Git, Hugo)
- Créer votre site Hugo avec le thème choisi
- Configurer un fichier README et .gitignore

Attendez que l'installation se termine. Cela peut prendre quelques minutes.

---

## Étape 4 : Télécharger sur GitHub

Mettons maintenant votre site sur GitHub pour que Cloudflare puisse y accéder.

1. **Ouvrez GitHub Desktop**

2. **Ajoutez votre dossier de site**
   - Cliquez sur "Add an Existing Repository from your Hard Drive..."
   - Sélectionnez votre dossier de site (celui que vous avez spécifié dans le générateur de commandes)
   - Cliquez sur "Add Repository"

3. **Publier sur GitHub**
   - Vous verrez un bouton "Publish repository" — cliquez dessus
   - Donnez un nom à votre dépôt (généralement le même que le nom de votre site)
   - Assurez-vous que "Keep this code private" est **décoché** (Cloudflare doit pouvoir y accéder)
   - Cliquez sur "Publish Repository"

4. **Voir sur GitHub**
   - Cliquez sur "View on GitHub" pour voir votre dépôt en ligne

Votre code est maintenant sur GitHub ! 🎉

---

## Étape 5 : Déployer sur Cloudflare Pages

Rendons maintenant votre site web en ligne !

1. **Allez sur Cloudflare**
   - Visitez [dash.cloudflare.com](https://dash.cloudflare.com) et connectez-vous
   - Ou allez directement à [dash.cloudflare.com/?to=/:account/workers-and-pages](https://dash.cloudflare.com/?to=/:account/workers-and-pages)

2. **Créer un projet Pages**
   - Cliquez sur "Create application"
   - Faites défiler vers "Looking to deploy Pages?" et cliquez sur **Get started**

3. **Se connecter à GitHub**
   - Cliquez sur "Connect to GitHub"
   - Autorisez Cloudflare si demandé
   - Sélectionnez votre dépôt de site dans la liste
   - Cliquez sur "Begin setup"

4. **Configurer les paramètres de build**
   - **Project name** : Peut être n'importe quoi (votre-nom-de-site)
   - **Production branch** : main
   - **Framework preset** : Sélectionnez **Hugo** dans le menu déroulant
   - Laissez tous les autres paramètres par défaut

5. **Déployer**
   - Cliquez sur "Save and Deploy"
   - Attendez que le build se termine (1-2 minutes)

6. **Visitez votre site**
   - Vous obtiendrez une URL comme `votre-nom-de-site.pages.dev`
   - Cliquez dessus pour voir votre site web en ligne !

🎉 **Votre site web est maintenant en ligne !**

---

## Étape 6 : Modifier Votre Contenu

Apprenons à modifier votre site web.

### Modifier avec l'Éditeur en Ligne de GitHub (Le Plus Simple)

1. Allez sur votre dépôt GitHub
2. Naviguez vers le dossier `content/` (ou où votre thème stocke le contenu)
3. Trouvez le fichier que vous voulez modifier (généralement des fichiers `.md`)
4. Cliquez sur l'icône crayon (✏️) pour modifier
5. Faites vos modifications
6. Faites défiler vers le bas et cliquez sur "Commit changes..."
7. Ajoutez un message de commit (par exemple, "Page d'accueil mise à jour")
8. Cliquez sur "Commit changes"

Cloudflare reconstruira automatiquement votre site. Attendez 1-2 minutes, puis rafraîchissez votre site en ligne.

### Ajouter une Nouvelle Page

1. Dans votre dépôt, naviguez vers le dossier de contenu
2. Cliquez sur "Add file" → "Create new file"
3. Nommez-le quelque chose comme `ma-nouvelle-page.md`
4. Ajoutez ceci en haut :
   ```yaml
   ---
   title: "Ma Nouvelle Page"
   ---
   ```
5. Écrivez votre contenu ci-dessous en Markdown
6. Validez les modifications

### Ajouter des Images

1. Dans votre dépôt, allez dans le dossier `static/` ou `assets/`
2. Cliquez sur "Upload files"
3. Glissez-déposez vos images
4. Validez les modifications
5. Référencez les images dans votre contenu avec `![Texte alternatif](nom-image.jpg)`

---

## Étape 7 : Pour Aller Plus Loin

Vous maîtrisez les bases ! Voici ce que vous pouvez explorer ensuite :

### Si vous voulez créer plus de sites...

Consultez le [**Guide Intermédiaire**](/quick-site-handbook/fr/intermediate) — il installe les outils globalement pour que vous puissiez créer des sites illimités sans tout réinstaller.

### Si vous voulez comprendre comment tout fonctionne...

Visitez le [**Guide Manuel**](/quick-site-handbook/fr/manual) pour des ressources sur :
- Comment fonctionnent les sites web statiques
- Les bases de la ligne de commande
- Les fondamentaux de Git
- Les thèmes Hugo et la personnalisation
- Les bases du HTML/CSS

### Prochaines étapes courantes

- **Ajouter un domaine personnalisé** : Dans Cloudflare Pages, allez sur "Custom domains" et suivez la configuration
- **Personnaliser votre thème** : Modifiez le fichier `hugo.toml` dans votre dépôt
- **Apprendre le Markdown** : Le format simple pour écrire du contenu — [Guide Markdown](https://www.markdownguide.org/)
- **Rejoindre la communauté Hugo** : [Hugo Discourse](https://discourse.gohugo.io/)

---

## Besoin d'Aide ?

Si quelque chose n'a pas fonctionné :

1. Consultez le [**Guide Manuel**](/quick-site-handbook/fr/manual) pour des explications détaillées
2. Recherchez votre message d'erreur en ligne
3. Consultez la [documentation Hugo](https://gohugo.io/documentation/)
4. Demandez sur le [forum communautaire Hugo](https://discourse.gohugo.io/)

Bonne chance avec votre site web ! 🚀
