variable "name" {
  description = "Name of the Windows Web App."
  type        = string
}

variable "location" {
  description = "Azure region where the resource will be deployed."
  type        = string
}

variable "tags" {
  description = "Tags applied to the resource."
  type        = map(string)
}

variable "resource_group_name" {
  description = "Name of the Resource Group."
  type        = string
}

variable "service_plan_id" {
  description = "ID of the App Service Plan."
  type        = string
}

variable "allowed_ip_address" {
  description = "Public IP address allowed to access the web application."
  type        = string
}

variable "allow_ip_rule_name" {
  description = "Name of the IP restriction rule."
  type        = string
}

variable "allow_tag_rule_name" {
  description = "Name of the Azure Traffic Manager service tag rule."
  type        = string
}