resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku
  resource_group_name = var.resource_group_name

  tags = var.tags

}

resource "azurerm_linux_web_app" "web_app" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.asp.id
  tags                = var.tags

  site_config {
    application_stack {
      dotnet_version = var.dotnet_version
    }


  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }

}