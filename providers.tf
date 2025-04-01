terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true # This is to avoid the error "Error: Provider azurerm not available in the registry"
  features {
    resource_group {
        prevent_deletion_if_contains_resources = true
    }
  }
}