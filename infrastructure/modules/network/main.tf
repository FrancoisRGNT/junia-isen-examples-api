# Crée un réseau virtuel Azure (VNet) pour connecter toutes les ressources de manière sécurisée.
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}-${var.random_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

# Sous-réseau dédié aux services applicatifs.
resource "azurerm_subnet" "app_subnet" {
  name                 = "app-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "delegation-for-app-service"
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

# Sous-réseau dédié aux ressources de stockage, comme Azure Storage Account.
resource "azurerm_subnet" "storage_subnet" {
  name                 = "storage-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Sous-réseau dédié au serveur PostgreSQL Flexible.
resource "azurerm_subnet" "database_subnet" {
  name                 = var.database_subnet_name     
  resource_group_name  = var.resource_group_name    
  virtual_network_name = azurerm_virtual_network.vnet.name 
  address_prefixes     = ["10.0.3.0/24"]              # Plage d'adresses spécifique pour ce sous-réseau.

  # Délégation pour PostgreSQL Flexible Server
  delegation {
    name = "delegation-for-postgresql"              
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers" 
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action", # Autorisations nécessaires.
      ]
      
    }
  }
}

resource "azurerm_network_security_group" "app_nsg" {
  name                = "app-networksecruity"
  resource_group_name = var.resource_group_name
  location            = var.location

  security_rule {
    name                       = "AllowDbSubnetTraffic"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.3.0/24"
    destination_address_prefix = "10.0.1.0/24"
  }
}

resource "azurerm_network_security_group" "db_nsg" {
  name                = "storage-networksecurity"
  resource_group_name = var.resource_group_name
  location            = var.location

  security_rule {
    name                       = "AllowAppSubnetTraffic"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "10.0.3.0/24"
  }
}