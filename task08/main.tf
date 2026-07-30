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


module "redis" {
  source = "./modules/redis"

  name                = local.redis_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  capacity = var.redis_capacity
  family   = var.redis_sku_family
  sku_name = var.redis_sku

  key_vault_id = module.keyvault.id

  redis_hostname_secret_name    = var.redis_hostname_secret_name
  redis_primary_key_secret_name = var.redis_primary_key_secret_name

  tags = local.tags
}

module "acr" {
  source = "./modules/acr"

  name                = local.acr_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku        = var.acr_sku
  image_name = var.image_name

  context_path = var.context_path
  git_pat      = var.git_pat

  tags = local.tags
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

  depends_on = [module.redis]
}



module "aci" {
  source = "./modules/aci"

  name                = local.aci_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  dns_name_label = local.aci_name
  sku            = var.aci_sku

  image = "${module.acr.login_server}/${var.image_name}:latest"

  acr_login_server = module.acr.login_server
  acr_username     = module.acr.admin_username
  acr_password     = module.acr.admin_password

  redis_url      = module.redis.redis_hostname
  redis_password = module.redis.redis_primary_key

  depends_on = [module.redis, module.acr]

  tags = local.tags
}


resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile(
    "${path.module}/k8s-manifests/secret-provider.yaml.tftpl",
    {
      aks_kv_access_identity_id  = module.aks.key_vault_identity_client_id
      kv_name                    = local.keyvault_name
      redis_url_secret_name      = var.redis_hostname_secret_name
      redis_password_secret_name = var.redis_primary_key_secret_name
      tenant_id                  = data.azurerm_client_config.current.tenant_id
    }
  )

  depends_on = [
    module.aks,
    module.redis
  ]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile(
    "${path.module}/k8s-manifests/deployment.yaml.tftpl",
    {
      acr_login_server = module.acr.login_server
      app_image_name   = var.image_name
      image_tag        = "latest"
    }
  )

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  depends_on = [
    kubectl_manifest.secret_provider
  ]
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  depends_on = [
    kubectl_manifest.deployment
  ]
}

data "kubernetes_service_v1" "app" {
  metadata {
    name = "redis-flask-app-service"
  }

  depends_on = [
    kubectl_manifest.service
  ]
}