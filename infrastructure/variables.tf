variable "github_handle" {
  type        = string
  nullable    = false
  description = "Your GitHub username (not your email, your @username)"
}

variable "subscription_id" {
  description = "ID de l'abonnement Azure utilisé pour déployer les ressources."
  type        = string
}

variable "email_address" {
  type        = string
  nullable    = false
  description = "Your JUNIA email address. Example: firstname.lastname@*.junia.com"
}

variable "location" {
  description = "Location for the resource group and services"
  default     = "France Central"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "app-service-junia"
}

variable "docker_image" {
  description = "Docker image to deploy"
  default     = "nginx:latest"
}

variable "storage_account_name" {
  description = "Nom du compte de stockage Azure."
  type        = string
  default     = "teststorageaccount"
}

variable "container_name" {
  description = "Nom du conteneur dans le compte de stockage Azure."
  type        = string
  default     = "test-container"
}

variable "vnet_name" {
  description = "Nom du Virtual Network (VNet) utilisé pour le réseau principal."
  type        = string
  default     = "junia-exe-vnet"
}

variable "address_space" {
  description = "Plage d'adresses CIDR utilisée pour le VNet."
  type        = list(string)
}