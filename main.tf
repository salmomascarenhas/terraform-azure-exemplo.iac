resource "azurerm_resource_group" "rg" {
    name = "rg-terraform"
    location = "brazilsouth"
    tags = {
        environment = "dev"
        Iac        = true
    }
}

resource "azurerm_virtual_network" "vnet" {
    name = "vnet-terraform"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    address_space = ["10.0.0.0/16"]
    tags = {
        environment = "dev"
        Iac        = true
    }
}