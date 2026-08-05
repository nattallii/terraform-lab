locals {
  firewall_name        = format("%s-fw", var.naming_prefix)
  firewall_subnet_name = "AzureFirewallSubnet"

  firewall_ip_config_name = format("%s-ipconfig", var.naming_prefix)

  route_table_name = format("%s-rt", var.naming_prefix)
  route_name       = format("%s-default_route", var.naming_prefix)


  application_rules_name = format("%s-app-rc", var.naming_prefix)
  network_rules_name     = format("%s-net-rc", var.naming_prefix)
  nat_rules_name         = format("%s-nat-rc", var.naming_prefix)

  network_rules = {

    dns = {
      port     = "53"
      protocol = "UDP"
    }

    ntp = {
      port     = "123"
      protocol = "UDP"
    }

    https = {
      port     = "443"
      protocol = "TCP"
    }

    http = {
      port     = "80"
      protocol = "TCP"
    }

  }

  nat_rules = {

    http = {
      port = "80"
    }

  }

  application_rules = {

    mcr = {
      fqdns = [
        "mcr.microsoft.com",
        "*.data.mcr.microsoft.com"
      ]
    }

    management = {
      fqdns = [
        "management.azure.com"
      ]
    }

    login = {
      fqdns = [
        "login.microsoftonline.com"
      ]
    }

    aks = {
      fqdns = [
        "*.azmk8s.io",
        "*.hcp.eastus.azmk8s.io"
      ]
    }

    packages = {
      fqdns = [
        "packages.microsoft.com"
      ]
    }
  }

}