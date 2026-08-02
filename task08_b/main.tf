data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location

  tags = local.tags
}

module "keyvault" {
  source = "./modules/keyvault"

  name                = local.keyvault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name  = var.keyvault_sku
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  tags = local.tags
}


module "aci_redis" {
  source = "./modules/aci_redis"

  name                = local.redis_aci_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dns_name_label = local.redis_aci_name
  sku            = var.redis_sku
  image          = var.redis_image

  key_vault_id = module.keyvault.id

  redis_hostname_secret_name = var.redis_hostname_secret_name
  redis_password_secret_name = var.redis_password_secret_name

  depends_on = [module.keyvault]

  tags = local.tags
}

module "storage" {
  source = "./modules/storage"

  name                = local.sa_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  container_name   = var.storage_container_name
  replication_type = var.storage_replication_type
  access_type      = var.container_access_type

  tags = local.tags
}


module "acr" {
  source = "./modules/acr"

  name                = local.acr_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku        = var.acr_sku
  image_name = var.image_name

  context_path = module.storage.blob_url
  sas_token    = module.storage.sas_token

  tags = local.tags
}

module "aca" {
  source = "./modules/aca"

  name     = local.aca_name
  env_name = local.aca_env_name

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  env_workload_profile_type = var.aca_env_workload_profile_type
  workload_profile_type     = var.aca_workload_profile_type

  image_name       = var.image_name
  acr_login_server = module.acr.login_server
  acr_id           = module.acr.id

  key_vault_id = module.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id

  redis_url_secret_id      = module.aci_redis.redis_hostname_secret_id
  redis_password_secret_id = module.aci_redis.redis_password_secret_id
  tags                     = local.tags
}

module "aks" {
  source = "./modules/aks"

  name                = local.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dns_prefix = var.name_prefix

  node_pool_name = var.aks_node_pool_name
  node_count     = var.aks_node_pool_count
  vm_size        = var.aks_node_pool_size
  tenant_id      = data.azurerm_client_config.current.tenant_id
  os_disk_type   = var.aks_node_pool_disk_type

  acr_id       = module.acr.id
  key_vault_id = module.keyvault.id

  tags = local.tags

  depends_on = [module.aci_redis]
}


module "k8s" {
  source = "./modules/k8s"

  acr_login_server = module.acr.login_server
  image_name       = var.image_name
  image_tag        = "latest"

  aks_kv_access_identity_id = module.aks.key_vault_identity_client_id

  kv_name   = local.keyvault_name
  tenant_id = data.azurerm_client_config.current.tenant_id

  redis_url_secret_name      = var.redis_hostname_secret_name
  redis_password_secret_name = var.redis_password_secret_name

  depends_on = [module.aks]
}