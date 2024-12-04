# Ressource pour créer un compte de stockage Azure
resource "azurerm_storage_account" "blob_storage" {
  name                     = var.storage_account_name      # Nom unique du compte de stockage, défini dans les variables
  resource_group_name      = var.resource_group_name       # Groupe de ressources où le compte sera créé
  location                 = var.location                  # Région où déployer le compte (ex: "East US")
  account_tier             = "Standard"                   # Niveau de performance du stockage ("Standard" ou "Premium")
  account_replication_type = "LRS"                        # Type de réplication ("LRS", "GRS", etc.)
}

# Ressource pour créer un conteneur dans le compte de stockage
resource "azurerm_storage_container" "blob_container" {
  name                  = var.container_name              
  storage_account_name  = azurerm_storage_account.blob_storage.name  #
  container_access_type = var.container_access_type
}

# Ajout d'un blob au conteneur de stockage.
resource "azurerm_storage_blob" "quotes_blob" {
  name                   = "quotes.json"  
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  source                 = "${path.module}/quotes.json"
}
