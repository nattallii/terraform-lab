data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

module "afw" {
  source = "./modules/afw"

  location = data.azurerm_resource_group.rg.location
  rg_name  = data.azurerm_resource_group.rg.name

  firewall_public_ip_name     = var.firewall_public_ip_name
  aks_load_balancer_public_ip = var.aks_load_balancer_public_ip

  aks_subnet_name      = var.aks_subnet_name
  virtual_network_name = var.virtual_network_name

  naming_prefix          = var.naming_prefix
  firewall_subnet_prefix = var.firewall_subnet_prefix

}
