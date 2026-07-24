variable "name" {
  description = "App service plan name"
  type        = string
}

variable "location" {
  description = "App service plan location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "sku_name" {
  description = "SKU name"
  type        = string
}

variable "worker_count" {
  description = "Count of worker instances"
  type        = number
}

variable "tags" {
  description = "Creator tag"
  type        = map(string)
} 