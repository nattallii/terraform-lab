resource "azurerm_container_group" "aci" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_address_type = "Public"
  dns_name_label  = var.dns_name_label
  os_type         = "Linux"
  sku             = var.sku

  container {
    name   = var.name
    image  = var.image
    cpu    = 1
    memory = 1.5

    ports {
      port     = 8080
      protocol = "TCP"
    }


    environment_variables = {
      CREATOR        = "ACI"
      REDIS_PORT     = "6380"
      REDIS_SSL_MODE = "True"
    }

    secure_environment_variables = {
      REDIS_URL = var.redis_url
      REDIS_PWD = var.redis_password
    }

  }

  image_registry_credential {
    server   = var.acr_login_server
    username = var.acr_username
    password = var.acr_password
  }

  tags = var.tags


}