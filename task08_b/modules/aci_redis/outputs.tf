output "redis_fqdn" {
  value       = azurerm_container_group.redis.fqdn
  description = "FQDN of redis"
}

output "redis_password_secret_id" {
  value       = azurerm_key_vault_secret.redis_password.id
  description = "redis password secret id"
}

output "redis_hostname_secret_id" {
  value       = azurerm_key_vault_secret.redis_hostname.id
  description = "redis hostname secret id"
}