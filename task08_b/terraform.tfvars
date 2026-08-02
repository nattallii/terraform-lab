name_prefix = "cmtr-bo177l9g-mod8b"

location = "westeurope"

redis_sku = "Standard"

keyvault_sku = "standard"

redis_password_secret_name = "redis-password"
redis_hostname_secret_name = "redis-hostname"

acr_sku    = "Basic"
image_name = "cmtr-bo177l9g-mod8b-app"

aks_node_pool_name      = "system"
aks_node_pool_count     = 1
aks_node_pool_size      = "Standard_D2ads_v6"
aks_node_pool_disk_type = "Ephemeral"

container_access_type = "private"

student_email = "nataliia_shynhelska@epam.com"

aca_env_workload_profile_type = "Consumption"
aca_workload_profile_type     = "Consumption"

redis_image = "mcr.microsoft.com/oss/bitnami/redis:7.4.2"

storage_container_name   = "app-content"
storage_replication_type = "LRS"