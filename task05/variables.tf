variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "creator_tag" {
  type        = string
  description = "Creator tag"
}



variable "app_service_plans" {
  type = map(object({
    name         = string
    sku_name     = string
    worker_count = number
  }))
}


variable "app_services" {
  type = map(object({
    name = string
  }))
}


variable "traffic_manager" {
  type = object({
    profile_name   = string
    routing_method = string
  })

  description = "Traffic Manager configuration"
}


variable "allow_ip_rule_name" {
  type = string
}

variable "allow_tag_rule_name" {
  type = string
}

variable "allowed_ip_address" {
  type = string
}