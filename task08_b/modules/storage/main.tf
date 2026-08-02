data "archive_file" "application" {
  type        = "tar.gz"
  source_dir  = "${path.root}/application"
  output_path = "${path.module}/application.tar.gz"
}

resource "azurerm_storage_account" "sa" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.replication_type

  tags = var.tags
}

resource "azurerm_storage_container" "sc" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.access_type
}


resource "azurerm_storage_blob" "application" {
  name                   = "application.tar.gz"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.sc.name
  type                   = "Block"

  source = data.archive_file.application.output_path
}

resource "time_static" "sas_start" {}

resource "time_offset" "sas_expiry" {
  base_rfc3339 = time_static.sas_start.rfc3339
  offset_hours = 24
}

data "azurerm_storage_account_sas" "sas_data" {
  connection_string = azurerm_storage_account.sa.primary_connection_string
  https_only        = true

  start  = time_static.sas_start.rfc3339
  expiry = time_offset.sas_expiry.rfc3339

  resource_types {
    container = true
    object    = true
    service   = false
  }

  services {
    blob  = true
    file  = false
    queue = false
    table = false
  }

  permissions {
    read    = true
    write   = false
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = false
    process = false
    tag     = false
    filter  = false
  }
}