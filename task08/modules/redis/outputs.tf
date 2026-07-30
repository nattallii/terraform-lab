output "hostname_secret_id" {
  description = "ID of the Key Vault secret containing the Redis hostname"
  value       = azurerm_key_vault_secret.redis_hostname.id
}

output "primary_key_secret_id" {
  description = "ID of the Key Vault secret containing the Redis primary access key"
  value       = azurerm_key_vault_secret.redis_primary_key.id
  sensitive   = true
}


output "redis_hostname" {
  description = "Redis hostname stored in Azure Key Vault"
  value       = azurerm_key_vault_secret.redis_hostname.value
  sensitive   = true
}

output "redis_primary_key" {
  description = "Redis primary access key stored in Azure Key Vault"
  value       = azurerm_key_vault_secret.redis_primary_key.value
  sensitive   = true
}