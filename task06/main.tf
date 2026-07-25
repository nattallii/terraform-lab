data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = local.tags

}


module "sql" {
  source              = "./modules/sql"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  sql_server_name               = local.sql_server_name
  sql_server_firewall_rule_name = var.sql_server_firewall_rule_name
  sql_server_db_name            = local.sql_db_name
  sql_admin_username            = var.sql_admin_username
  sql_database_sku              = var.sql_database_sku
  allowed_ip_address            = var.allowed_ip_address
  key_vault_id                  = data.azurerm_key_vault.kv.id
  sql_admin_secret_name         = var.sql_admin_secret_name
  sql_password_secret_name      = var.sql_password_secret_name

  tags = local.tags
}

module "webapp" {
  source = "./modules/webapp"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  web_app_name          = local.app_name
  app_service_plan_name = local.asp_name
  app_service_plan_sku  = var.app_service_plan_sku
  dotnet_version        = var.dotnet_version
  sql_connection_string = module.sql.sql_connection_string

  tags = local.tags

}