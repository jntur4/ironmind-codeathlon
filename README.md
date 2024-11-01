# Ironmind Codeathlon
> 2e qualification ULaval - CS Games 2025

Bienvenue a la 2e qualification des CS Games 2025 de l'universite laval!
Aujourd'hui, en equipe de 3, nous allons tester.

# Horraire
| Horaire       | Description                                |
|---------------|--------------------------------------------|
| 19h30        | Lancement de la première version            |
| 20h          | Début de la compétition                     |
| 21h          | Changement de siège                         |
| 22h          | Changement de siège                         |
| 23h          | Début de la mise en commun                  |
| 23h15        | Rendu final & fin de la compétition         |


## Description

[Frontend](.)

[Backend](./backend/README.md)

[Base de données](./db/README.md)

# Docker :whale:

1. Installer [Docker](https://docs.docker.com/engine/install/) selon votre OS.

## Fonctionnement du docker-compose
Démarrer/reconstruire les conteneurs via la commande suivante :
```bash
docker-compose up --build --force-recreate --renew-anon-volumes -d
```
Les paramètres spécifiés permettent de réinitialiser complètement la base de données (entres autres) à chaque démarrage, afin que les migrations soient réexécutées. 

> [!TIP]
> `-d` permet de lancer les conteneurs en arrière-plan. Il est possible de retirer cet argument pour utiliser CTRL+C afin d'arrêter les conteneurs.