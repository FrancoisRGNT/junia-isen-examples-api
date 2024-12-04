# Projet de Cloud Computing
## API développée sur Azure avec Terraform

### À propos du projet


Dans ce projet, nous avons conçu et provisionné une infrastructure cloud sur Microsoft Azure en utilisant Terraform. 
Nous avons déployé une API,mais nous n'avons pas réussi à la connecter à une base de données 
Nous avons mis en place un workflow sur Github pour réaliser des testes à chaque push

## Groupe

Ce projet a été réalisé par :

- Joachim DIEU
- François REGNAUT
- Alexandre LUPINE
- Victor MAES

## Technologies utilisées

- Terraform : version 1.5.7 pour la gestion de l'infrastructure en tant que code.
- Python : version 3.12 pour le développement de l'API.
- GitHub Actions : pour automatiser les workflows CI/CD.
- Azure CLI : pour l'administration des ressources dans Azure.


## Structure du projet

- `.github` : contient les workflows pour CI/CD.
- `api` : contient l'API développée avec FastAPI.
- `infrastructure` : contient le code déclaratif pour provisionner l'infrastructure Azure avec Terraform.
- `tests` : inclut les tests unitaires pour valider les endpoints de l'API.

## Crédit

Groupe LEDUC, main.tf du dossier network

## Installation et déploiement

1. Clonez ce dépôt sur votre machine et ouvrez le avec un IDE quelconque.
2. Dans ./infrastructure, renommez le fichier "terraform.tfvars.sample" en "terraform.tfvars" et remplissez le avec toutes les informations requises.
3. Dans le même chemin, exécuter les commandes : "terraform init", "terraform plan" et "terraform apply"

### Prérequis

- Terraform : version 1.5.7 ou supérieure (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
- Azure CLI : version 2.66 ou supérieure (https://learn.microsoft.com/fr-fr/cli/azure/install-azure-cli).
- Un compte Azure valide avec les permissions nécessaires.