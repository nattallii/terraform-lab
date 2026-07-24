variable "traffic_manager_profile_name" {
  description = "Name of the Azure Traffic Manager profile."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the Traffic Manager profile will be created."
  type        = string
}

variable "traffic_manager_routing_method" {
  description = "Traffic routing method used by the Traffic Manager profile."
  type        = string
}

variable "tags" {
  description = "Tags applied to the Traffic Manager profile."
  type        = map(string)
}

variable "endpoints" {
  description = "Map of Azure Traffic Manager endpoints."
  type = map(object({
    name               = string
    target_resource_id = string
  }))
}