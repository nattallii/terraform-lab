variable "name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the Key Vault will be created"
  type        = string
}

variable "location" {
  description = "Azure region where the Key Vault will be created"
  type        = string
}

variable "sku_name" {
  description = "SKU name of the Azure Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID associated with the Azure Key Vault"
  type        = string
}

variable "object_id" {
  description = "Microsoft Entra tenant ID associated with the Azure Key Vault"
  type        = string
}


variable "tags" {
  description = "Tags to assign to the Azure Key Vault"
  type        = map(string)
  default     = {}
}