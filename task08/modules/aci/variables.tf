variable "name" {
  description = "Name of the Azure Container Group"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the Azure Container Group will be created"
  type        = string
}

variable "location" {
  description = "Azure region where the Azure Container Group will be created"
  type        = string
}

variable "sku" {
  description = "SKU of the Azure Container Group"
  type        = string
}

variable "image" {
  description = "Docker image to deploy to Azure Container Instances"
  type        = string
}

variable "acr_login_server" {
  description = "Login server of the Azure Container Registry"
  type        = string
}

variable "acr_username" {
  description = "Username used to authenticate to Azure Container Registry"
  type        = string
}

variable "acr_password" {
  description = "Password used to authenticate to Azure Container Registry"
  type        = string
  sensitive   = true
}

variable "redis_url" {
  description = "Redis hostname used by the application"
  type        = string
}

variable "redis_password" {
  description = "Redis primary access key used by the application"
  type        = string
  sensitive   = true
}

variable "dns_name_label" {
  description = "DNS name label assigned to the Azure Container Group"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the Azure Container Group"
  type        = map(string)
  default     = {}
}