output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}
output "web_subnet_name" {
  value = azurerm_subnet.websnet.name
}

output "web_subnet_address_prefix" {
  value = azurerm_subnet.websnet.address_prefixes

}
