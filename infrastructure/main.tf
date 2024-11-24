provider "azurerm" {
  features {}
}

# Appel des modules
module "network" {
  source       = "./modules/network"
  resource_group_name = var.resource_group_name
  location     = var.location
}

module "database" {
  source           = "./modules/database"
  resource_group_name = var.resource_group_name
  location         = var.location
  vnet_id          = module.network.vnet_id
}

module "blob_storage" {
  source           = "./modules/blob_storage"
  resource_group_name = var.resource_group_name
  location         = var.location
}

module "app_service" {
  source           = "./modules/app_service"
  resource_group_name = var.resource_group_name
  location         = var.location
  storage_account_name = module.blob_storage.storage_account_name
  database_connection_string = module.database.connection_string
  subnet_id        = module.network.subnet_id
}