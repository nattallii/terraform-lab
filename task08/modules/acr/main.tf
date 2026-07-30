resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  admin_enabled = true



  tags = var.tags
}

resource "azurerm_container_registry_task" "build" {
  name                  = "${var.name}-build"
  container_registry_id = azurerm_container_registry.acr.id

  platform {
    os = "Linux"
  }

  docker_step {
    dockerfile_path      = "task08/application/Dockerfile"
    context_path         = var.context_path
    context_access_token = var.git_pat

    image_names = [
      "${var.image_name}:latest"
    ]
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "build" {
  container_registry_task_id = azurerm_container_registry_task.build.id
}