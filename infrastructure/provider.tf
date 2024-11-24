# provider.tf

# Définit la version de Terraform requise pour le projet
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0"  # Indique la version minimale de Terraform pour ce projet
    }
  }

  # Spécifie la version de Terraform à utiliser
  required_version = ">= 1.0"
}

# Configure le fournisseur Azure
provider "azurerm" {
  features {}  # Nécessaire mais sans paramètres particuliers pour les ressources de base
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}