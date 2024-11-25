# Variable pour le nom unique du compte de stockage
variable "storage_account_name" {
  description = "Nom unique pour le compte de stockage" 
  type        = string
}

# Variable pour le nom du groupe de ressources où les ressources seront créées
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure"    
  type        = string
}

# Variable pour la région où déployer les ressources
variable "location" {
  description = "Région Azure où créer les ressources" 
  type        = string
}

# Variable pour le nom du conteneur Blob
variable "container_name" {
  description = "Nom du conteneur Blob"
  type        = string
}

# Variable pour définir l'accès au conteneur Blob
variable "container_access_type" {
  description = "Type d'accès au conteneur Blob (private, blob, container)"
  type        = string
  default     = "private" # Valeur par défaut : accès privé
}