# Base de données

Bienvenue dans la base de données de notre projet de vente de billets.

Notre équipe a déjà proposé une architecture et un début de projet. Cependant, elle est actuellement en vacances et le projet doit être finalisé. Il est de votre responsabilité de compléter les différentes tâches afin que notre application soit un succès.

Vous avez carte blanche pour réaliser la base de données. Si vous préférez Oracle, PostgreSQL (mais pas Rust, s'il vous plaît), amusez-vous !

Notre entreprise souhaite une solution plug-and-play, c'est-à-dire qu'elle ne prendra pas le temps d’apprendre à installer votre application. Pour cette raison, l’un de nos techniciens a jugé bon de vous fournir un Dockerfile pour construire l’application. Nous attendons donc de vous un Dockerfile que notre équipe d’infrastructure pourra facilement déployer dans le cloud.

## Installation :inbox_tray: 
1. Télécharger [MySQL](https://dev.mysql.com/downloads/installer/)
   > [!TIP]
   > Choisissez un mot de passe facile pour vos coéquipiers. Si vous le perdez, il peut être difficile d'en recréer un nouveau.
2. (Peut-être redémarrer votre laptop pour que le pilote soit bien pris en compte)

## Utilisation :lemon:
Pour interagir avec votre base de données, vous avez deux options :
1. Utiliser [DataGrip](https://www.jetbrains.com/datagrip/download/)
2. Utiliser `MySQL Command Line Client`, directement disponible sur votre ordinateur après l'installation de MySQL.

## Fonctionnement du conteneur
1. Démarrer les conteneurs via `docker-compose` (voir README.md à la racine du projet)
2. [Accéder à l'interface d'administration de la base de données (Adminer)](http://localhost:8080)
3. Se connecter à la base de données avec les identifiants suivants :
    - Serveur : `db`
    - Utilisateur : Voir le fichier `.env`, variable `MARIADB_USER`
    - Mot de passe : Voir le fichier `.env`, variable `MARIADB_PASSWORD`
    - Base de données : Voir le fichier `.env`, variable `MARIADB_DATABASE`