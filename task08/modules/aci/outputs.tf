output "fqdn" {
  description = "Fully qualified domain name of the Azure Container Group"
  value       = azurerm_container_group.aci.fqdn
}

output "ip_address" {
  description = "Public IP address of the Azure Container Group"
  value       = azurerm_container_group.aci.ip_address
}