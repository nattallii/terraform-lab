#resource group

module "rg1" {
  source = "./modules/resource_group"

  name     = var.resource_groups["rg1"].name
  location = var.resource_groups["rg1"].location

  tags = {
    Creator = var.creator_tag
  }
}

module "rg2" {
  source = "./modules/resource_group"

  name     = var.resource_groups["rg2"].name
  location = var.resource_groups["rg2"].location

  tags = {
    Creator = var.creator_tag
  }
}

module "rg3" {
  source = "./modules/resource_group"

  name     = var.resource_groups["rg3"].name
  location = var.resource_groups["rg3"].location

  tags = {
    Creator = var.creator_tag
  }
}

#app service plan


module "asp1" {
  source = "./modules/app_service_plan"

  name         = var.app_service_plans["asp1"].name
  sku_name     = var.app_service_plans["asp1"].sku_name
  worker_count = var.app_service_plans["asp1"].worker_count

  resource_group_name = module.rg1.name
  location            = module.rg1.location

  tags = {
    Creator = var.creator_tag
  }
}

module "asp2" {
  source = "./modules/app_service_plan"

  name         = var.app_service_plans["asp2"].name
  sku_name     = var.app_service_plans["asp2"].sku_name
  worker_count = var.app_service_plans["asp2"].worker_count

  resource_group_name = module.rg2.name
  location            = module.rg2.location

  tags = {
    Creator = var.creator_tag
  }
}

#app service

module "app1" {
  source = "./modules/app_service"

  name                = var.app_services["app1"].name
  resource_group_name = module.rg1.name
  location            = module.rg1.location

  service_plan_id = module.asp1.id

  allowed_ip_address  = var.allowed_ip_address
  allow_ip_rule_name  = var.allow_ip_rule_name
  allow_tag_rule_name = var.allow_tag_rule_name

  tags = {
    Creator = var.creator_tag
  }

}

module "app2" {
  source = "./modules/app_service"

  name                = var.app_services["app2"].name
  resource_group_name = module.rg2.name
  location            = module.rg2.location

  service_plan_id = module.asp1.id

  allowed_ip_address  = var.allowed_ip_address
  allow_ip_rule_name  = var.allow_ip_rule_name
  allow_tag_rule_name = var.allow_tag_rule_name

  tags = {
    Creator = var.creator_tag
  }

}




#traffic manager

module "traffic_manager" {
  source = "./modules/traffic_manager"

  traffic_manager_profile_name   = var.traffic_manager.profile_name
  traffic_manager_routing_method = var.traffic_manager.routing_method

  resource_group_name = module.rg3.name

  tags = {
    Creator = var.creator_tag
  }

  endpoints = {
    app1 = {
      name               = "app1"
      target_resource_id = module.app1.id
    }

    app2 = {
      name               = "app2"
      target_resource_id = module.app2.id
    }
  }
}