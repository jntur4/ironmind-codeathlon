# Backend

## Instalation
1. Prenez l'IDE de votre choix. ([PyCharm](https://www.jetbrains.com/pycharm/download/?source=google&medium=cpc&campaign=AMER_en_CA_PyCharm_Branded&term=pycharm&content=698987581431&gad_source=1&gclid=Cj0KCQjwveK4BhD4ARIsAKy6pMIW-uosTmAa9Js14EAwl1zDj7-BokIFOzjbAoFSRHsSIomY5lHiTQMaAiRJEALw_wcB&section=windows) est le meilleur d'ailleurs, Community ou Pro edition).
2. Installez les packages avec requirements.txt (Nous vous conseillons un environnement virtuel).
3. Lancez l'application avec `python main.py`.

## Configuration
Le fichier app_launcher.py permet de construire l'application. Il lance le serveur backend, initialise les différents services et inscrit les routes.

TL;DR : Renseignez vos nouvelles routes et dépendances dans les fonctions __initialize_dependencies et __setup_app.

> [!IMPORTANT]
> Vous n'avez normalement pas à changer l'IP et le PORT du serveur.

> [!IMPORTANT]
> Vous n'avez normalement pas à changer l'IP, USER, PASSWORD, et DATABASE.

> [!NOTE]
> Vous n'avez pas à modifier le middleware.

## Description des couches
### Ressource
La **couche resource** d'une API est le point d'entrée principal pour toutes les requêtes HTTP telles que GET, POST, PUT, et DELETE. Elle sert à séparer la logique de gestion des requêtes HTTP de la logique métier (services) de l'application.

### Service
La **couche service**, dans notre utilisation aujourd'hui, va nous servir à __effectuer des vérifications__ et à communiquer avec la couche infra qui interagit avec la base de données.

Par exemple, si l'on prend notre classe item, on pourrait réaliser une vérification sur le champ item.price < 0. Cette vérification pourrait renvoyer une réponse au client indiquant que le prix ne peut pas être négatif.
### Domaine
La **couche domaine** sert simplement à représenter nos objets à l'intérieur de l'application. Dans le template fourni, la classe Item en est un bon exemple.

### Infra
La **couche infra** réalise les opérations vers la base de données. Elle peut donc ajouter, supprimer et récupérer des informations.

# Postman
Afin de pouvoir utiliser votre API, nous vous suggérons d'utiliser l'application. [Postman](https://www.postman.com/downloads/).
(C'est utile pour vos prochains cours btw)

# Danger zone

> [!DANGER]
> Nous vous conseillons de ne pas modifier le `ServiceLocator`.
