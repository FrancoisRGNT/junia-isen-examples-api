variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure"
  type        = string
}

variable "location" {
  description = "Région Azure"
  type        = string
  default     = "East US"
}