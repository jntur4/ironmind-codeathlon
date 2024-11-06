# Ironmind Codeathlon
> 2ème qualification ULaval - CS Games 2025

L'objectif est de créer une plateforme permettant l'achat de billets pour les matchs de football à domicile du Rouge et Or de l'Université Laval. Ce projet est réalisé sous la forme d'un triathlon par une équipe de 3 développeurs aspirants au CS Games 2025, chaque membre ayant une heure pour travailler sur chaque composant de la plateforme.

La plateforme est divisée en trois composants :
- **Frontend**: Interface utilisateur permettant la consultation des événements et l'achat de billets.
- **Backend**: Gestion des transactions, des utilisateurs et des réservations de sièges.
- **Base de données**: Stockage des données utilisateur, des événements, et des sièges.

## Règlements de la Compétition
- La compétition est en équipe de **3**.
- Les membres de l'équipe travaillent sur un composant pendant une heure, puis changent de composant.
- Communication **limitée** aux partages suivants :
    - Schéma de base de données : partageable entre les membres via des outils collaboratifs comme `visio`, `draw.io`, etc.
    - Documentation d'API : routes, paramètres, et réponses, partageable entre les membres.

## Horaire
| Horaire       | Description                                |
|---------------|--------------------------------------------|
| 19h30        | Explication de la compétition               |
| 20h          | Début de la compétition                     |
| 21h          | Changement de siège                         |
| 22h          | Changement de siège                         |
| 23h          | Début de la mise en commun                  |
| 23h15        | Rendu final & fin de la compétition         |

# Installation :whale:

1. Installer [Docker](https://docs.docker.com/engine/install/) selon votre OS.
2. Une personne de votre équipe va forker le dépôt (public ou privé). Les deux autres personnes vont ensuite cloner SON dépôt.
3. Mettez en place un moyen de communication pour partager vos idées selon la section `Communication **limitée** aux partages suivants`.

## Fonctionnement du docker-compose
Démarrer/reconstruire les conteneurs via la commande suivante :
```bash
docker-compose up --build --force-recreate --renew-anon-volumes -d
```
Les paramètres spécifiés permettent de réinitialiser complètement la base de données (entres autres) à chaque démarrage, afin que les migrations soient réexécutées. 

> [!TIP]
> `-d` permet de lancer les conteneurs en arrière-plan. Il est possible de retirer cet argument pour utiliser CTRL+C afin d'arrêter les conteneurs.

# Tâches à réaliser
## Frontend
1. **Page à Propos**

    - Doit présenter la mascotte de l'Université Laval. (Bonus pour une animation de la mascotte)

2. **Page consultation des événements**

    - L'utilisateur peut visualiser les événements à venir.


3. **Création de compte**
    
    Champs requis:
    - Prénom
    - Nom de famille
    - Sexe (Homme, Femme, non-binaire, etc.)
    - Programme (sélectionné parmi ceux stockés en base de données)
    - Date de naissance
    - Courriel ULaval (validation sur le domaine @ulaval.ca)
    - Mot de passe (minimum 8 caractères, avec au moins un chiffre et un symbole)

4. **Connexion et gestion de compte**

    - Connexion avec courriel ULaval et mot de passe.
    - Modification des informations personnelles.

5. **Réservation de siège**

    - Sélection d'un siège dans le stade Telus pour un événement précis.
    - Choix possible entre liste déroulante ou représentation visuelle des sections et sièges.

6. **Consultation des billets**

    - Affichage des billets réservés par l'utilisateur.

## Backend
1. **Gestion des programmes et des sexes**

    - Routes pour obtenir la liste des programmes et des sexes.

2. **Création de compte utilisateur**

    - Validation des données envoyées par le frontend.
    - Hashage du mot de passe.
    - Vérification d'unicité du mot de passe.
    - Validation du sexe avec l'API [genderize.io](https://genderize.io/) :
        - Si le sexe fourni ne correspond pas au sexe supposé par l'API, la création est refusée (sexe Homme ou Femme seulement).

3. **Connexion et modification d'utilisateur**

    - Route pour connecter un utilisateur et valider ses informations.
    - Route pour modifier les informations de l'utilisateur.

4. **Gestion des événements**

    - Route pour obtenir la liste des événements à venir.

5. **Réservation de billets**

    - Pour les utilisateurs **connectés seulement**.
    - Les billets sont assignés en fonction des contraintes suivantes :
        - Incompatibilité de programmes : Un IIG ne doit pas être assis immédiatement à côté d'un GLO ou IFT.
        - Conditions météorologiques : réduction de prix proportionnelle au pourcentage de précipitations (via une API météo).
        - Stock restant : réduction de 42 % si plus de 50 % des billets d'une section sont non-vendus à la veille de l'événement.
        - Dominance de programme : augmentation en fonction du nombre de Fibonacci si le programme est majoritaire dans une section.
        - Diversité nationale : réduction de 10 % pour les utilisateurs dont le pays le plus probable n'est pas membre du G7 (API nationalize.io).
        - Réduction basée sur l'âge : rabais de 2 $ si la somme des chiffres de l'âge est pair, ou ajout du chiffre si tous les chiffres sont identiques.

6. **Consultation des Billets Réservés**

    - Route pour afficher les billets réservés par l'utilisateur.

## Base de données

### Structure des Données

1. **Utilisateurs**: Stockage des informations personnelles des utilisateurs.

2. **Programmes**: Liste des programmes (ex. IFT, GLO, IIG).

3. **Sexes**: Liste des sexes possibles.

4. **Sièges du stade telus**:

    - Informations sur chaque siège, incluant le numéro, la section, le prix de base, etc.
    - Pré-population des sièges dans la base de données.

5. **Événements à venir**: Stockage des informations des événements.

6. **Réservations de sièges**: Liste des sièges réservés par les utilisateurs pour chaque événement.

### Contraintes et Triggers

1. **Trigger de modification de prix**

    À chaque 20 billets achetés, un trigger modifie le prix de tous les sièges en fonction d'un pourcentage aléatoire (+/-5%).

2. **Historique des modifications**

    Une table supplémentaire pour chaque table principale stocke l'historique de toutes les modifications (insertion, suppression, modification), avec l'auteur et la date.

3. **Procédure de création de sièges**

    Utilisée pour ajouter des sièges, accessible uniquement à usage interne.

4. **Migration de données**

    Migration avec fausses données, incluant une procédure permettant de générer un nombre défini d'utilisateurs, d'événements et de billets.

### Normalisation

La base de données respecte le plus possible les formes normales pour assurer la cohérence et l'efficacité.

# Modalités de rendu
Nous vous fournissons un template de base, mais vous êtes libre de le modifier ou de le recréer selon vos préférences et besoins avec le(s) langage(s) et technologie(s) de votre choix

Rendu à l'étape de la mise en commun, poussez votre code dans le dépôt. Envoyez le lien de votre dépôt à l'adresse suivante : clement.abergel.1@ulaval.ca.

**Exigence principale**: assurez-vous que l'intégralité du projet puisse être lancée avec **une seule commande Docker**, permettant de démarrer facilement le frontend, le backend et la base de données.

> [!WARNING]
> Pas de docker = pas de correction.
