# Plan de service pour l'App Service
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_hostname
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Déploiement de l'App Service
resource "azurerm_app_service" "app_service" {
  name                = var.app_service_hostname
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
}