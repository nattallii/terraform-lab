variable "name" {
  description = "Name of the Azure Redis Cache instance"
  type        = string
}

variable "location" {
  description = "Azure region where the Azure Redis Cache instance will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the Azure Redis Cache instance will be created"
  type        = string
}

variable "capacity" {
  description = "Capacity of the Azure Redis Cache instance"
  type        = number
}

variable "family" {
  description = "SKU family of the Azure Redis Cache instance"
  type        = string
}

variable "sku_name" {
  description = "SKU name of the Azure Redis Cache instance"
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Azure Key Vault where Redis secrets will be stored"
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Name of the Key Vault secret used to store the Redis hostname"
  type        = string
}

variable "redis_primary_key_secret_name" {
  description = "Name of the Key Vault secret used to store the Redis primary access key"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the Azure Redis Cache instance"
  type        = map(string)
}