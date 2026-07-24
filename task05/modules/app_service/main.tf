resource "azurerm_windows_web_app" "as" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  tags = var.tags

  site_config { #блок налаштувань App Service

    ip_restriction_default_action = "Deny"


    dynamic "ip_restriction" { #автоматично створити один або кілька блоків ip_restriction
      for_each = local.ip_rules

      content {
        name     = ip_restriction.value.name
        priority = ip_restriction.value.priority
        action   = "Allow"

        ip_address  = try(ip_restriction.value.ip_address, null)
        service_tag = try(ip_restriction.value.service_tag, null)
      }
    }

  }
}

locals {
  ip_rules = [
    {
      name       = var.allow_ip_rule_name
      ip_address = var.allowed_ip_address
      priority   = 100
    },
    {
      name        = var.allow_tag_rule_name
      service_tag = "AzureTrafficManager"
      priority    = 110
    }
  ]
}