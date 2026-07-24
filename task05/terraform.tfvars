resource_groups = {
  rg1 = {
    name     = "cmaz-bo177l9g-mod5-rg-01"
    location = "West Europe"
  },
  rg2 = {
    name     = "cmaz-bo177l9g-mod5-rg-02"
    location = "North Europe"
  },
  rg3 = {
    name     = "cmaz-bo177l9g-mod5-rg-03"
    location = "East US"
  }
}


app_service_plans = {
  asp1 = {
    name         = "cmaz-bo177l9g-mod5-asp-01"
    sku_name     = "S1"
    worker_count = 2
  }

  asp2 = {
    name         = "cmaz-bo177l9g-mod5-asp-02"
    sku_name     = "S1"
    worker_count = 1
  }
}

app_services = {
  app1 = {
    name = "cmaz-bo177l9g-mod5-app-01"
  }

  app2 = {
    name = "cmaz-bo177l9g-mod5-app-02"
  }
}

allow_ip_rule_name  = "allow-ip"
allow_tag_rule_name = "allow-tm"

traffic_manager = {
  profile_name   = "cmaz-bo177l9g-mod5-traf"
  routing_method = "Performance"
}


creator_tag = "nataliia_shynhelska@epam.com"

allowed_ip_address = "18.153.146.156/32"