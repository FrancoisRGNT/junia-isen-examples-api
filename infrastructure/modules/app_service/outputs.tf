output "app_service_hostname" { #Exporte l'URL de l'appli déployé
  value = azurerm_app_service.app_service.name
}