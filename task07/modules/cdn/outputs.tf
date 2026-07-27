output "endpoint_hostname" {
  description = "Hostname of the Azure Front Door endpoint."
  value       = azurerm_cdn_frontdoor_endpoint.fd_endpoint.host_name
}