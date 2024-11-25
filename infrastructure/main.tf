data "azurerm_subscription" "current" {
}

data "github_user" "user" {
  username = var.github_handle
}

provider "azurerm" {
  features {}
}

resource "random_id" "unique_suffix" {
  byte_length = 4
} 

# Groupe de ressources (nécessaire pour tous les services)
resource "azurerm_resource_group" "rg_junia" {
  name     = "${var.resource_group_name}${random_id.unique_suffix.hex}"
  location = "France Central"
}

#Appel des modules

module "app_service" {
  source                 = "./modules/app_service" # Chemin vers ton module
  resource_group_name    = azurerm_resource_group.rg_junia.name
  location               = var.location
  app_service_hostname       = "test-app-service-plan-${random_id.unique_suffix.hex}"
}

module "blob_storage" {
  source                = "./modules/blob_storage"
  storage_account_name  = substr("${var.storage_account_name}${random_id.unique_suffix.hex}", 0, 24)
  container_name        = var.container_name
  resource_group_name   = azurerm_resource_group.rg_junia.name
  location              = var.location
}

module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  resource_group_name = var.resource_group_name
  location            = var.location
  random_suffix       = random_id.unique_suffix.hex
}