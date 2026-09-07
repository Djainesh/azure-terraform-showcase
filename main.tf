resource "azurerm_resource_group" "rg" {
  name     = "rg-tflearning"
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = "sttflearning${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

module "network" {
  source               = "./modules/network"
  vnet_name            = "vnet-tf-learning"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  subnets              = var.subnets
}

module "compute" {
  source              = "./modules/compute"
  vm_name              = "vm-tf-learning"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  subnet_id             = module.network.subnet_ids["web"]
  admin_username         = var.admin_username
  admin_password         = var.admin_password
}

