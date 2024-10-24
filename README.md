# Ironmind Codeathlon
> 2e qualification ULaval - CS Games 2025

## Description

[Frontend](.)

[Backend](./backend/README.md)

[Base de données](./db/README.md)

## Fonctionnement du docker-compose
Démarrer les conteneurs via la commande suivante :
```bash
docker-compose up --build --force-recreate --renew-anon-volumes
```
Les paramètres spécifiés permettent de réinitialiser complètement la base de données (entres autres) à chaque démarrage, afin que les migrations soient réexécutées. 
