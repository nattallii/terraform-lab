output "traffic_manager_fqdn" {
  description = "Fully qualified domain name of the Traffic Manager profile."
  value       = azurerm_traffic_manager_profile.tm_profile.fqdn
}