resource "azurerm_user_assigned_identity" "aca_identity" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_container_app_environment" "acae" {
  name                = var.env_name
  location            = var.location
  resource_group_name = var.resource_group_name

  workload_profile {
    name                  = "Consumption"
    workload_profile_type = var.env_workload_profile_type
  }

  tags = var.tags

}

resource "azurerm_role_assignment" "aca_rbac" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.aca_identity.principal_id

}

resource "azurerm_key_vault_access_policy" "aca_policy" {
  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = azurerm_user_assigned_identity.aca_identity.principal_id

  secret_permissions = [
    "Get",
    "List"
  ]
}



resource "azurerm_container_app" "aca" {
  name                         = var.name
  container_app_environment_id = azurerm_container_app_environment.acae.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"
  workload_profile_name        = var.workload_profile_type
  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.aca_identity.id
    ]
  }



  registry {
    server   = var.acr_login_server
    identity = azurerm_user_assigned_identity.aca_identity.id
  }

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 8080
    transport                  = "auto"

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = var.name
      image  = "${var.acr_login_server}/${var.image_name}:latest"
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "CREATOR"
        value = "ACA"
      }

      env {
        name  = "REDIS_PORT"
        value = "6379"
      }

      env {
        name        = "REDIS_URL"
        secret_name = "redis-url"
      }

      env {
        name        = "REDIS_PWD"
        secret_name = "redis-key"
      }
    }
  }

  secret {
    name                = "redis-url"
    key_vault_secret_id = var.redis_url_secret_id
    identity            = azurerm_user_assigned_identity.aca_identity.id
  }

  secret {
    name                = "redis-key"
    key_vault_secret_id = var.redis_password_secret_id
    identity            = azurerm_user_assigned_identity.aca_identity.id
  }


  depends_on = [
    azurerm_role_assignment.aca_rbac,
    azurerm_key_vault_access_policy.aca_policy
  ]

  tags = var.tags
}

