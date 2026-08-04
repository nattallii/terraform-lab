output "azure_firewall_public_ip" {
  description = "Azure Firewall Public IP address"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "azure_firewall_private_ip" {
  description = "Azure Firewall Private IP address"
  value       = azurerm_firewall.fw.ip_configuration[0].private_ip_address
}