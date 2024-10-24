# Base de données

## Fonctionnement du conteneur
1. Démarrer les conteneurs via `docker-compose` (voir README.md à la racine du projet)
2. [Accéder à l'interface d'administration de la base de données (Adminer)](http://localhost:8080)
3. Se connecter à la base de données avec les identifiants suivants :
    - Serveur : `db`
    - Utilisateur : Voir le fichier `.env`, variable `MARIADB_USER`
    - Mot de passe : Voir le fichier `.env`, variable `MARIADB_PASSWORD`
    - Base de données : Voir le fichier `.env`, variable `MARIADB_DATABASE`