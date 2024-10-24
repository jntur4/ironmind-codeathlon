# Ironmind Codeathlon
> 2e qualification ULaval - CS Games 2025

## Description

[Frontend](.)

[Backend](./backend/README.md)

[Base de données](./db/README.md)

## Fonctionnement du docker-compose
Démarrer/reconstruire les conteneurs via la commande suivante :
```bash
docker-compose up --build --force-recreate --renew-anon-volumes -d
```
Les paramètres spécifiés permettent de réinitialiser complètement la base de données (entres autres) à chaque démarrage, afin que les migrations soient réexécutées. 

> [!INFO]
> `-d` permet de lancer les conteneurs en arrière-plan. Il est possible de retirer cet argument pour utiliser CTRL+C afin d'arrêter les conteneurs.