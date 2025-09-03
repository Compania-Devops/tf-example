variable "idapp" {
  description = "ID de la aplicación"
  type        = string
  default     = "apellido" # Reemplazar por apellido
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
  
  backend "azurerm" {
    resource_group_name   = "rg-cicd-terraform-app-apellido" # Reemplazar por apellido
    storage_account_name  = "tfstateapellido" # Reemplazar por apellido
    container_name        = "tfstate"
    key                   = "dev/terraform.tfstate"
  }
}

provider "azurerm" {
    features {}
    subscription_id = "b6dd1983-a328-4ef9-aae9-b401b616479d"
}



data "azurerm_resource_group" "main" {
    name = "rg-cicd-terraform-app-${var.idapp}"
}

resource "azurerm_storage_account" "main" {
    name                     = "st${var.idapp}001tf"
    resource_group_name      = data.azurerm_resource_group.main.name
    location                 = data.azurerm_resource_group.main.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
}
