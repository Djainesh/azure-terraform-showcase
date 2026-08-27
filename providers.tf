terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstate308028088"
    container_name       = "tfstate"
    key                  = "day1-project.tfstate"
  }
}

provider "azurerm" {
  features {}
}