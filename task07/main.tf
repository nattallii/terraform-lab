resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = local.tags
}

import {
  to = azurerm_resource_group.rg
  id = var.rg_id
}

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  account_replication_type = local.storage_account_replication_type
  account_tier             = local.storage_account_tier

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false

  tags = local.tags

}

import {
  to = azurerm_storage_account.sa
  id = var.sa_id
}


module "cdn" {
  source   = "./modules/cdn"
  location = var.location

  sa_id   = azurerm_storage_account.sa.id
  sa_name = azurerm_storage_account.sa.name

  rg_id   = azurerm_resource_group.rg.id
  rg_name = azurerm_resource_group.rg.name

  fd_profile_name      = var.fd_profile_name
  fd_profile_sku       = var.fd_profile_sku
  fd_endpoint_name     = var.fd_endpoint_name
  fd_origin_group_name = var.fd_origin_group_name
  fd_origin_name       = var.fd_origin_name
  fd_route_name        = var.fd_route_name

  sa_primary_blob_host = azurerm_storage_account.sa.primary_blob_host
  blob_file            = var.blob_file
}