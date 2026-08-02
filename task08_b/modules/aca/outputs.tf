output "aca_fqdn" {
  value       = azurerm_container_app.aca.latest_revision_fqdn
  description = "ACA FQDN"
}