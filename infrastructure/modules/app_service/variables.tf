# Nom du groupe de ressources Azure
variable "resource_group_name" {
  description = "The name of the resource group" # Description pour clarifier l'usage de la variable
  type        = string                           # Type de variable : chaîne de caractères
}

# Emplacement géographique (région Azure)
variable "location" {
  description = "The Azure location where the resources will be created" 
  default     = "France Central" 
}

# Nom de l'App Service
variable "app_service_hostname" {
  description = "The name of the Azure App Service" # Nom de l'application App Service
  type        = string
}