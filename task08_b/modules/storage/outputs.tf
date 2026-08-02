output "blob_url" {
  value       = azurerm_storage_blob.application.url
  description = "url of blob storage"
}

output "sas_token" {
  value       = data.azurerm_storage_account_sas.sas_data.sas
  sensitive   = true
  description = "sas token"
}