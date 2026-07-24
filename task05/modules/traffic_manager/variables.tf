variable "traffic_manager_profile_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "traffic_manager_routing_method" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "endpoints" {
  type = map(object({
    name               = string
    target_resource_id = string
  }))
}