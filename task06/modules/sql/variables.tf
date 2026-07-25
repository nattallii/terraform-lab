variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group where the SQL Server will be deployed."
}

variable "location" {
  type        = string
  description = "Azure region where SQL resources will be deployed."
}

variable "sql_server_name" {
  type        = string
  description = "Name of the Azure SQL logical server."
}

variable "sql_server_db_name" {
  type        = string
  description = "Name of the Azure SQL Database."
}

variable "sql_admin_username" {
  type        = string
  description = "Administrator username for the Azure SQL Server."
}

variable "allowed_ip_address" {
  type        = string
  description = "Public IP address allowed to connect to the Azure SQL Server."
}

variable "sql_database_sku" {
  type        = string
  description = "Service tier (SKU) for the Azure SQL Database."
}

variable "key_vault_id" {
  type        = string
  description = "ID of the existing Azure Key Vault used to store SQL credentials."
}

variable "sql_admin_secret_name" {
  type        = string
  description = "Name of the Key Vault secret that stores the SQL administrator username."
}

variable "sql_password_secret_name" {
  type        = string
  description = "Name of the Key Vault secret that stores the SQL administrator password."
}

variable "sql_server_firewall_rule_name" {
  type        = string
  description = "Name of the SQL Server firewall rule."
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources created by the SQL module."
}