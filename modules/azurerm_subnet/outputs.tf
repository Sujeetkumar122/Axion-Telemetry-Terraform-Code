output "subnet_ids" {
  description = "Map of subnet names and keys to subnet IDs"
  value = merge(
    { for k, v in azurerm_subnet.subnet : v.name => v.id },
    { for k, v in azurerm_subnet.subnet : k => v.id }
  )
}
