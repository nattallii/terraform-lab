name_prefix = "cmtr-bo177l9g-mod8"

location = "East US"

redis_capacity   = 2
redis_sku        = "Basic"
redis_sku_family = "C"

keyvault_sku = "standard"

redis_primary_key_secret_name = "redis-primary-key"
redis_hostname_secret_name    = "redis-hostname"

acr_sku    = "Basic"
image_name = "cmtr-bo177l9g-mod8-app"

aci_sku = "Standard"

aks_node_pool_name      = "system"
aks_node_pool_count     = 1
aks_node_pool_size      = "Standard_D2ads_v6"
aks_node_pool_disk_type = "Ephemeral"

student_email = "nataliia_shynhelska@epam.com"

context_path = "https://github.com/nattallii/terraform-lab.git"