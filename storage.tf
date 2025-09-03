terraform {
  backend "azurerm" {
    resource_group_name   = "rg-cicd-terraform-app-apellido" # Reemplazar por apellido
    storage_account_name  = "tfstateapellido}" # Reemplazar por apellido
    container_name        = "tfstate"
    key                   = "dev/terraform.tfstate"
  }
}

variable "idapp" {
  description = "ID de la aplicación"
  type        = string
  default     = "apellido" # Reemplazar por apellido
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

