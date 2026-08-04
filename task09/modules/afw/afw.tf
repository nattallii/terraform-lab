data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "firewall_subnet" {
  name                 = local.firewall_subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes = [
    var.firewall_subnet_prefix
  ]
}

data "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.rg_name
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.firewall_public_ip_name
  location            = var.location
  resource_group_name = var.rg_name

  allocation_method = "Static"
  sku               = "Standard"

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_firewall" "fw" {
  name                = local.firewall_name
  location            = var.location
  resource_group_name = var.rg_name

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  ip_configuration {
    name                 = local.firewall_ip_config_name
    subnet_id            = azurerm_subnet.firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_route_table" "rt" {
  name                = local.route_table_name
  location            = var.location
  resource_group_name = var.rg_name

  route {
    name                   = local.route_name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.fw.ip_configuration[0].private_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "aks" {
  subnet_id      = data.azurerm_subnet.aks_subnet.id
  route_table_id = azurerm_route_table.rt.id
}

resource "azurerm_firewall_application_rule_collection" "fwarc" {
  name                = local.application_rules_name
  azure_firewall_name = azurerm_firewall.fw.name
  resource_group_name = var.rg_name

  priority = 100
  action   = "Allow"

  dynamic "rule" {
    for_each = local.application_rules

    content {
      name = rule.key

      source_addresses = [
        data.azurerm_subnet.aks_subnet.address_prefixes[0]
      ]

      target_fqdns = rule.value.fqdns

      protocol {
        port = "443"
        type = "Https"
      }
    }
  }
}

resource "azurerm_firewall_network_rule_collection" "fwnrc" {
  name                = local.network_rules_name
  azure_firewall_name = azurerm_firewall.fw.name
  resource_group_name = var.rg_name

  priority = 200
  action   = "Allow"

  dynamic "rule" {
    for_each = local.network_rules

    content {
      name = rule.key

      source_addresses = [
        data.azurerm_subnet.aks_subnet.address_prefixes[0]
      ]

      destination_addresses = [
        "*"
      ]

      destination_ports = [
        rule.value.port
      ]

      protocols = [
        rule.value.protocol
      ]
    }
  }
}

resource "azurerm_firewall_nat_rule_collection" "fwnat" {
  name                = local.nat_rules_name
  azure_firewall_name = azurerm_firewall.fw.name
  resource_group_name = var.rg_name

  priority = 300
  action   = "Dnat"

  dynamic "rule" {
    for_each = local.nat_rules

    content {
      name = rule.key

      source_addresses = [
        "*"
      ]

      destination_ports = [
        rule.value.port
      ]

      destination_addresses = [
        azurerm_public_ip.public_ip.ip_address
      ]
      translated_address = var.aks_loadbalancer_ip

      translated_port = tonumber(rule.value.port)

      protocols = [
        "TCP"
      ]

    }
  }
}