---
title: Générateur de Commandes
description: Générez des commandes personnalisées pour créer votre site Hugo.
---

Le Générateur de Commandes est un outil web qui crée la commande exacte dont vous avez besoin pour exécuter dans votre terminal ou PowerShell.

:::tip[Ouvrir le Générateur]
👉 [**Ouvrir le Générateur de Commandes**](/quick-site-handbook/fr/command-generator)
:::

---

## Comment Ça Marche

Le générateur demande quelques détails, puis crée une commande que vous pouvez copier et coller. Pas besoin de taper de longues commandes manuellement !

---

## Commandes Disponibles

### 1. La Commande Ultime (Débutants)

**Idéal pour** : Les utilisateurs qui veulent tout faire automatiquement.

Cette commande unique va :
- Installer Pixi (s'il n'est pas présent)
- Installer Git et Hugo
- Créer votre site Hugo
- Ajouter votre thème choisi
- Configurer README et .gitignore

**Ce dont vous avez besoin** :
- Nom du site (lettres, chiffres, tirets uniquement)
- URL GitHub du thème
- Chemin du dossier où vous voulez le site

### 2. Installer les Outils Seulement

**Idéal pour** : Les utilisateurs suivant le [Guide Intermédiaire](/quick-site-handbook/fr/intermediate).

Installe Pixi, Git et Hugo globalement pour que vous puissiez créer plusieurs sites.

Exécutez ceci une fois, puis utilisez "Créer Site Seulement" pour chaque nouveau site.

### 3. Créer Site Seulement

**Idéal pour** : Les utilisateurs qui ont déjà installé les outils globalement.

Crée un nouveau site Hugo en supposant que Git et Hugo sont déjà disponibles sur votre système.

---

## Trouver l'URL de Votre Thème

1. Allez sur [themes.gohugo.io](https://themes.gohugo.io/)
2. Parcourez et sélectionnez un thème qui vous plaît
3. Cliquez sur le bouton **Demo** du thème pour le prévisualiser
4. Cliquez sur le bouton **Download** ou cherchez un lien GitHub
5. Copiez l'URL de la barre d'adresse de votre navigateur
   - Elle devrait ressembler à : `https://github.com/nom-utilisateur/nom-theme`

---

## Obtenir le Chemin du Dossier

### Mac

1. Ouvrez le **Finder**
2. Naviguez vers l'endroit où vous voulez votre dossier de site
3. **Clic droit** sur le dossier
4. Maintenez la touche **Option**
5. Cliquez sur **"Copier le chemin d'accès"**

### Windows

1. Ouvrez l'**Explorateur de fichiers**
2. Naviguez vers l'endroit où vous voulez votre dossier de site
3. **Maj + Clic droit** sur le dossier
4. Cliquez sur **"Copier en tant que chemin d'accès"**

### Linux

1. Ouvrez votre gestionnaire de fichiers
2. Naviguez vers le dossier parent
3. **Clic droit** → "Propriétés" pour voir le chemin
4. Ou dans le terminal : `pwd` pour afficher le chemin actuel

---

## Sélection de Plateforme

Le générateur affiche différentes commandes pour :

- **Mac / Linux** : Utilise des scripts `bash` avec `curl`
- **Windows** : Utilise des scripts PowerShell avec `irm`

Assurez-vous de sélectionner l'onglet correct avant de copier !

---

## Après Avoir Exécuté la Commande

Une fois votre site créé :

1. **Téléchargez sur GitHub** en utilisant [GitHub Desktop](https://desktop.github.com/)
2. **Déployez sur Cloudflare** en suivant le [guide de Démarrage Rapide](/quick-site-handbook/fr/quickstart#%C3%A9tape-5--d%C3%A9ployer-sur-cloudflare-pages)
3. **Modifiez votre contenu** en utilisant l'éditeur en ligne de GitHub ou VS Code

---

## Dépannage

### "Command not found"

- Assurez-vous d'avoir copié la commande entière
- Sur Windows, assurez-vous d'utiliser PowerShell (pas l'Invite de commandes)
- Essayez de redémarrer votre terminal

### Permission refusée (Mac/Linux)

Vous devrez peut-être rendre le script exécutable :
```bash
chmod +x nom-du-script.sh
```

### Le script ne s'exécute pas (Windows)

Vous devrez peut-être changer la politique d'exécution :
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## Note de Sécurité

Ces scripts téléchargent et exécute du code depuis ce site web. Examinez toujours les scripts avant de les exécuter si vous n'êtes pas sûr. Les scripts sont open source et disponibles dans notre [dépôt GitHub](https://github.com/arthursw/quick-site-handbook/tree/main/public).
