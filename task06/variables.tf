variable "name_prefix" {
  type        = string
  description = "Prefix used to generate Azure resource names."
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed."
}


variable "allowed_ip_address" {
  type        = string
  description = "Public IP address allowed to connect to Azure SQL Server."
}

variable "sql_database_sku" {
  type        = string
  description = "SKU (service tier) of the Azure SQL Database."
}


variable "sql_admin_username" {
  type        = string
  description = "Administrator username for Azure SQL Server."
}


variable "key_vault_name" {
  type        = string
  description = "Name of the existing Azure Key Vault."
}

variable "key_vault_rg_name" {
  type        = string
  description = "Resource Group where the existing Key Vault is located."
}

variable "creator_tag" {
  type        = string
  description = "Creator tag"
}

variable "sql_server_firewall_rule_name" {
  type        = string
  description = "Firewall rule name."
}

variable "sql_admin_secret_name" {
  type        = string
  description = "Admin secret name"
}

variable "sql_password_secret_name" {
  type        = string
  description = "Password secret name"
}

variable "app_service_plan_sku" {
  type        = string
  description = "App service plan sku"
}

variable "dotnet_version" {
  type        = string
  description = "Dotnet version"
}