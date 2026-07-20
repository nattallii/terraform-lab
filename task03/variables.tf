variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account name"
}

variable "vnet_name" {
  type        = string
  description = "Virtual Network name"
}

variable "frontend_subnet_name" {
  type        = string
  description = "Frontend subnet"
}

variable "backend_subnet_name" {
  type        = string
  description = "Backend subnet"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "creator_tag" {
  type        = string
  description = "Creator tag"
}