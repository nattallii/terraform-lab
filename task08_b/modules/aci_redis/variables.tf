variable "name" {
  description = "Name of the Azure Container Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "dns_name_label" {
  description = "DNS name label"
  type        = string
}

variable "sku" {
  description = "Azure Container Group SKU"
  type        = string
}

variable "image" {
  description = "Redis image from Microsoft Artifact Registry"
  type        = string
}

variable "key_vault_id" {
  description = "Azure Key Vault ID"
  type        = string
}

variable "redis_password_secret_name" {
  description = "Key Vault secret name for Redis password"
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Key Vault secret name for Redis hostname"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}