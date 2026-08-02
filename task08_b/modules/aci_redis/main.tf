# Random password (to create Redis password)
# Azure Container Group instance (ACI)
# Key Vault secrets (to store Redis hostname and password)

resource "random_password" "redis_password" {
  length  = 16
  special = false
}

resource "azurerm_container_group" "redis" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_name_label      = var.dns_name_label
  ip_address_type     = "Public"
  os_type             = "Linux"
  sku                 = var.sku



  container {
    name   = var.name
    image  = var.image
    cpu    = 1
    memory = 1.5

    ports {
      port     = 6379
      protocol = "TCP"
    }

    commands = [
      "redis-server",
      "--protected-mode",
      "no",
      "--requirepass",
      random_password.redis_password.result
    ]
  }
  tags = var.tags
}



resource "azurerm_key_vault_secret" "redis_password" {
  name         = var.redis_password_secret_name
  value        = random_password.redis_password.result
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.redis_hostname_secret_name
  value        = azurerm_container_group.redis.fqdn
  key_vault_id = var.key_vault_id
}