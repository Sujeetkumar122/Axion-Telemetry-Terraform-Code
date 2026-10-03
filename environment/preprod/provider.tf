terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-sujeet"
    storage_account_name = "stpreprod02"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}
