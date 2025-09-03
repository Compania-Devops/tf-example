terraform {
  backend "azurerm" {
    resource_group_name  = "rg-cicd-terraform-app-apellido" # Reemplazar por apellido
    storage_account_name = "tfstateapellido"                # Reemplazar por apellido
    container_name       = "tfstate"
    key                  = "dev/terraform.tfstate"
  }
}