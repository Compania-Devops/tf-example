locals {
  idapp = "apellido" # Apellido
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b6dd1983-a328-4ef9-aae9-b401b616479d" # Id de suscripción
}