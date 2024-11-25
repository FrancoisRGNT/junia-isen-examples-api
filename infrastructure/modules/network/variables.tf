variable "vnet_name" {
  description = "Nom du réseau virtuel (VNet) utilisé pour connecter les ressources Azure."
  type        = string
  default     = null                                   # Valeur par défaut nulle pour permettre une personnalisation.
}


# Définit la plage d'adresses CIDR utilisée pour le réseau virtuel (par exemple : ["10.0.0.0/16"]).
variable "address_space" {
  description = "Plage d'adresses CIDR pour le réseau virtuel Azure (VNet)."
  type        = list(string)
}

variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure où le VNet et ses sous-réseaux seront créés."
  type        = string
}


variable "location" {
  description = "Région Azure où les ressources seront déployées."
  type        = string
}

variable "app_subnet_name" {
  description = "Nom du sous-réseau utilisé pour les services applicatifs, comme Azure App Service."
  type        = string
  default     = "app-subnet"                          # Nom par défaut pour une utilisation standard.
}

variable "storage_subnet_name" {
  description = "Nom du sous-réseau utilisé pour les services de stockage Azure."
  type        = string
  default     = "storage-subnet"                      # Nom par défaut pour une utilisation standard.
}

variable "database_subnet_name" {
  description = "Nom du sous-réseau dédié aux bases de données comme PostgreSQL Flexible Server."
  type        = string
  default     = "database-subnet"                     # Nom par défaut pour une utilisation standard.
}

# Variable permettant d'obtenir des noms aléatoires lors de la création.
variable "random_suffix" {
  description = "Suffixe aléatoire pour rendre les noms uniques"
  type        = string
}