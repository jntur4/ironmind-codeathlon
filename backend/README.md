# Backend

Bienvenue dans le backend de notre vente de billets.

Notre équipe a déjà proposé une architecture et un début de projet. Cependant, elle est actuellement en vacances et le projet doit être terminé. Il est de votre responsabilité de compléter les différentes tâches du backend afin que notre application soit un succès.

Vous avez carte blanche pour réaliser le backend. Ajoutez les packages que vous souhaitez dans le fichier `requirements.txt`. Si vous préférez un backend en JavaScript, Java, C#, brainfuck (mais pas Rust, s'il vous plaît), amusez-vous !

Notre entreprise souhaite une solution plug-and-play, c'est-à-dire qu'elle ne prendra pas le temps de comprendre comment installer votre application. Pour cela, un de nos techniciens a jugé bon de vous fournir un Dockerfile pour construire l'application. Nous attendons donc de vous un Dockerfile que notre équipe d'infrastructure pourra facilement déployer dans le cloud.

## Installation :inbox_tray: 
1. Prenez l'IDE de votre choix. ([PyCharm](https://www.jetbrains.com/pycharm/download/?source=google&medium=cpc&campaign=AMER_en_CA_PyCharm_Branded&term=pycharm&content=698987581431&gad_source=1&gclid=Cj0KCQjwveK4BhD4ARIsAKy6pMIW-uosTmAa9Js14EAwl1zDj7-BokIFOzjbAoFSRHsSIomY5lHiTQMaAiRJEALw_wcB&section=windows) est le meilleur d'ailleurs, Community ou Pro edition).
2. Installez les packages avec `requirements.txt` (Nous vous conseillons un environnement virtuel).
3. Lancez l'application avec `python main.py`.

## Configuration :gear:
Le fichier app_launcher.py permet de construire l'application. Il lance le serveur backend, initialise les différents services et inscrit les routes.

TL;DR : Renseignez vos nouvelles routes dans `__setup_app`.

> [!IMPORTANT]
> Vous n'avez normalement pas à changer l'IP et le PORT du serveur.

> [!IMPORTANT]
> Vous n'avez normalement pas à changer l'IP, USER, PASSWORD, et DATABASE.

> [!NOTE]
> Vous n'avez pas à modifier le middleware.

# Postman :email:
Afin de pouvoir utiliser votre API, nous vous suggérons d'utiliser l'application. [Postman](https://www.postman.com/downloads/).
(C'est utile pour vos prochains cours btw)

> [!NOTE]
> 127.0.0.1:3000/api/item

# Docker :whale2:
Pour construire le docker:
```commandline
docker build -t cs-ironmind:backend -f ./docker/dockerfile .
```
