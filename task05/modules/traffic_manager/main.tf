resource "azurerm_traffic_manager_profile" "tm_profile" {
  name                   = var.traffic_manager_profile_name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.traffic_manager_routing_method

  dns_config {
    relative_name = var.traffic_manager_profile_name
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = var.tags
}



resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoint" {
  for_each = var.endpoints

  name                 = each.value.name
  profile_id           = azurerm_traffic_manager_profile.tm_profile.id
  always_serve_enabled = true
  weight               = 100
  target_resource_id   = each.value.target_resource_id
}