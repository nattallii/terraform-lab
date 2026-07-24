resource "azurerm_service_plan" "asp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  worker_count        = var.worker_count
  os_type             = "Windows"

  tags = var.tags
}


