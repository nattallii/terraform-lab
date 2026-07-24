variable "resource_groups" {
  description = "Configuration of Azure Resource Groups."
  type = map(object({
    name     = string
    location = string
  }))
}

variable "creator_tag" {
  description = "Creator tag applied to all resources."
  type        = string
}

variable "app_service_plans" {
  description = "Configuration of Azure App Service Plans."
  type = map(object({
    name         = string
    sku_name     = string
    worker_count = number
  }))
}

variable "app_services" {
  description = "Configuration of Azure Windows Web Apps."
  type = map(object({
    name = string
  }))
}

variable "traffic_manager" {
  description = "Configuration of the Azure Traffic Manager profile."
  type = object({
    profile_name   = string
    routing_method = string
  })
}

variable "allow_ip_rule_name" {
  description = "Name of the IP restriction rule."
  type        = string
}

variable "allow_tag_rule_name" {
  description = "Name of the Azure Traffic Manager service tag rule."
  type        = string
}

variable "allowed_ip_address" {
  description = "Public IP address allowed to access the web applications."
  type        = string
}