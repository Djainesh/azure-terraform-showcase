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
