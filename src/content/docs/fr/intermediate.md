---
title: Guide Intermédiaire
description: Installez les outils une fois, créez des sites Hugo illimités.
---

Ce guide est destiné aux utilisateurs qui prévoient de créer **plusieurs sites web**. Au lieu d'installer les outils pour chaque site, nous allons les installer une fois globalement sur votre système.

## Démarrage Rapide vs Intermédiaire

| Approche | Idéal Pour | Temps de Configuration |
|----------|------------|------------------------|
| **Démarrage Rapide** | Un site web, configuration la plus rapide | Chaque site réinstalle les outils |
| **Intermédiaire** | Plusieurs sites web | Installer une fois, créer beaucoup |

---

## Ce Que Ce Guide Couvre

À la fin, vous aurez :
- ✓ Installé Pixi, Git et Hugo globalement sur votre système
- ✓ Créé votre premier site en utilisant les outils globaux
- ✓ Appris à créer des sites supplémentaires rapidement

---

## Prérequis

Identiques au Démarrage Rapide :
- **Compte GitHub** : [S'inscrire](https://github.com/join)
- **Compte Cloudflare** : [S'inscrire](https://dash.cloudflare.com/sign-up)
- **GitHub Desktop** : [Télécharger](https://desktop.github.com/download/)
- **Un thème Hugo** : [Parcourir les thèmes](https://themes.gohugo.io/)

---

## Étape 1 : Installer les Outils Globalement

D'abord, nous allons installer les trois outils dont vous aurez besoin : **Pixi** (gestionnaire de paquets), **Git** (contrôle de version) et **Hugo** (générateur de site).

### Mac / Linux

Ouvrez le Terminal et exécutez :

```bash
curl -fsSL https://arthursw.github.io/quick-site-handbook/install-tools.sh | bash
```

### Windows

Ouvrez PowerShell et exécutez :

```powershell
irm https://arthursw.github.io/quick-site-handbook/install-tools.ps1 | iex
```

:::details[Que fait ceci ?]
Ce script :
1. Vérifie si Pixi est installé (l'installe si ce n'est pas le cas)
2. Exécute `pixi global install git` pour installer Git
3. Exécute `pixi global install hugo` pour installer Hugo

Ces outils sont maintenant disponibles sur tout le système, pas seulement dans un dossier de projet.
:::

Attendez que l'installation se termine. Vous devrez peut-être redémarrer votre terminal/PowerShell une fois terminé.

---

## Étape 2 : Créer Votre Premier Site

Maintenant que les outils sont installés, créer un site est beaucoup plus rapide.

### Générez Votre Commande

Allez sur le [**Générateur de Commandes**](/quick-site-handbook/fr/command-generator) et sélectionnez :
- **Onglet** : "Créer Site Seulement" (pas "Commande Ultime")
- Remplissez le nom de votre site, l'URL du thème et le chemin du dossier
- Copiez la commande

### Exécutez la Commande

**Mac / Linux** (Terminal) :
```bash
# Collez la commande du générateur
curl -fsSL https://arthursw.github.io/quick-site-handbook/new-site.sh | bash -s -- -s mysite -t https://github.com/theNewDynamic/gohugo-theme-ananke.git -p /chemin/vers/sites
```

**Windows** (PowerShell) :
```powershell
# Collez la commande du générateur
irm https://arthursw.github.io/quick-site-handbook/new-site.ps1 | iex -s -- -s mysite -t https://github.com/theNewDynamic/gohugo-theme-ananke.git -p C:\chemin\vers\sites
```

:::details[Que fait ceci ?]
Ce script :
1. Crée un nouveau site Hugo avec `hugo new site`
2. Initialise Git avec `git init`
3. Ajoute votre thème comme sous-module Git
4. Configure `hugo.toml` avec le nom du thème
5. Crée un README.md et .gitignore utiles
:::

---

## Étape 3 : Télécharger et Déployer

Suivez les mêmes étapes que le Démarrage Rapide :

1. **Téléchargez sur GitHub** en utilisant GitHub Desktop
   - Ajoutez le dépôt existant
   - Publiez sur GitHub

2. **Déployez sur Cloudflare Pages**
   - Connectez votre dépôt GitHub
   - Sélectionnez "Hugo" comme préréglage de framework
   - Déployez !

Consultez les [Étapes 4-5 du Démarrage Rapide](/quick-site-handbook/fr/quickstart#%C3%A9tape-4--t%C3%A9l%C3%A9charger-sur-github) pour des instructions détaillées.

---

## Créer des Sites Supplémentaires

Maintenant que les outils sont installés globalement, créer d'autres sites est simple :

### En Utilisant le Générateur de Commandes

1. Allez sur le [**Générateur de Commandes**](/quick-site-handbook/fr/command-generator)
2. Sélectionnez l'onglet "Créer Site Seulement"
3. Remplissez le nouveau nom de site, thème et dossier
4. Copiez et exécutez la commande

### Création Manuelle de Site (Optionnel)

Si vous préférez comprendre chaque étape :

```bash
# Créer un nouveau site
hugo new site mon-second-site
cd mon-second-site

# Initialiser git
git init

# Ajouter un thème (remplacez par l'URL de votre thème)
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke

# Configurer le thème
echo "theme = 'ananke'" >> hugo.toml

# Créer un README
cat > README.md << 'EOF'
# Mon Second Site

## Développement
- Modifier le contenu dans `content/`
- Tester localement : `hugo server -D`
- Voir sur : http://localhost:1313

## Déploiement
Les changements poussés sur GitHub se déploient automatiquement sur Cloudflare Pages.
EOF

# Créer .gitignore
cat > .gitignore << 'EOF'
# Fichiers générés
public/
resources/
.hugo_build.lock

# Fichiers système
.DS_Store
Thumbs.db
EOF
```

---

## Gérer Vos Sites

### Lister les Outils Installés

Pour voir quelles versions vous avez :

```bash
# Vérifier la version de Hugo
hugo version

# Vérifier la version de Git
git --version

# Vérifier la version de Pixi
pixi --version
```

### Mettre à Jour les Outils

Pour mettre à jour vers les dernières versions :

```bash
# Mettre à jour Hugo
pixi global upgrade hugo

# Mettre à jour Git
pixi global upgrade git

# Mettre à jour tous les paquets globaux
pixi global upgrade-all
```

### Désinstaller les Outils

Si vous devez supprimer les outils :

```bash
pixi global remove hugo
pixi global remove git
```

---

## Développement Local (Optionnel)

Avec l'installation globale, vous pouvez facilement prévisualiser les sites avant de les pousser sur GitHub :

```bash
# Naviguez vers le dossier de votre site
cd /chemin/vers/votre-site

# Démarrez le serveur de développement
hugo server -D

# Ouvrez http://localhost:1313 dans votre navigateur
```

- Modifiez les fichiers et voyez les changements instantanément
- Appuyez sur `Ctrl+C` pour arrêter le serveur
- L'option `-D` inclut le contenu en brouillon

---

## Résumé

**Avantages de l'installation globale :**
- ✅ Créer des sites plus rapidement (pas de réinstallation)
- ✅ Utiliser le serveur de développement (`hugo server`)
- ✅ Plus facile à gérer et mettre à jour
- ✅ Mieux pour apprendre et expérimenter

**Quand utiliser le Démarrage Rapide à la place :**
- Vous ne faites qu'un seul site web
- Vous voulez la configuration la plus simple
- Vous ne voulez pas d'outils installés sur votre système

---

## Prochaines Étapes

- En savoir plus sur [**Hugo**](https://gohugo.io/documentation/)
- Explorer les [**thèmes Hugo**](https://themes.gohugo.io/)
- Lire le [**Guide Manuel**](/quick-site-handbook/fr/manual) pour une compréhension plus approfondie
- Rejoindre la [**communauté Hugo**](https://discourse.gohugo.io/)
