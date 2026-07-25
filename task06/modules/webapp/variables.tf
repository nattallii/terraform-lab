variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "app_service_plan_name" {
  description = "ASP name"
  type        = string
}

variable "app_service_plan_sku" {
  description = "ASP SKU"
  type        = string
}

variable "web_app_name" {
  type        = string
  description = "web app name"
}

variable "dotnet_version" {
  type        = string
  description = "dotnet version"
}

variable "tags" {
  description = "Tags applied to the Traffic Manager profile."
  type        = map(string)
}

variable "location" {
  type        = string
  description = "location"
}

variable "sql_connection_string" {
  type        = string
  sensitive   = true
  description = "Connection string до Azure SQL Database"
}