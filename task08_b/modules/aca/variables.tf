#############################
# General
#############################

variable "name" {
  description = "Name of the Azure Container App"
  type        = string
}

variable "env_name" {
  description = "Name of the Azure Container App Environment"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

#############################
# Container App Environment
#############################

variable "env_workload_profile_type" {
  description = "Container App Environment workload profile type"
  type        = string
}

#############################
# Container App
#############################

variable "workload_profile_type" {
  description = "Container App workload profile type"
  type        = string
}

variable "image_name" {
  description = "Docker image name"
  type        = string
}

#############################
# Azure Container Registry
#############################

variable "acr_id" {
  description = "Azure Container Registry ID"
  type        = string
}

variable "acr_login_server" {
  description = "Azure Container Registry login server"
  type        = string
}

#############################
# Azure Key Vault
#############################

variable "key_vault_id" {
  description = "Azure Key Vault ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}



variable "redis_url_secret_id" {
  description = "Redis Url Secret ID"
  type        = string
}

variable "redis_password_secret_id" {
  description = "Redis Password Secret ID"
  type        = string
  sensitive   = true
}