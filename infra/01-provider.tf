terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.117.1"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.17.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "x"
  tenant_id = "x"
  skip_provider_registration = true
  #  client_id = ""
#  client_secret = ""
  features {}
}
data "azurerm_resource_group" "example" {
  name     = "x"
}