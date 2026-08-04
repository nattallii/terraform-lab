locals {
  firewall_name        = "${var.naming_prefix}-fw"
  firewall_subnet_name = "AzureFirewallSubnet"

  firewall_ip_config_name = "${var.naming_prefix}-ipconfig"

  route_table_name = "${var.naming_prefix}-rt"

  application_rules_name = "${var.naming_prefix}-app-rc"
  network_rules_name     = "${var.naming_prefix}-net-rc"
  nat_rules_name         = "${var.naming_prefix}-nat-rc"


}

