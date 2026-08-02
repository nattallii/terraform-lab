#############################
# General
#############################

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "name_prefix" {
  description = "Prefix used to generate Azure resource names"
  type        = string
}

variable "student_email" {
  description = "Student email used in the Creator tag"
  type        = string
}

#############################
# Key Vault
#############################

variable "keyvault_sku" {
  description = "Azure Key Vault SKU"
  type        = string
}

variable "redis_password_secret_name" {
  description = "Redis password secret name"
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Redis hostname secret name"
  type        = string
}

#############################
# Redis ACI
#############################

variable "redis_sku" {
  description = "Azure Container Instance SKU"
  type        = string
}

variable "redis_image" {
  description = "Redis image from Microsoft Artifact Registry"
  type        = string
}

#############################
# Storage
#############################

variable "storage_replication_type" {
  description = "Storage Account replication type"
  type        = string
}

variable "storage_container_name" {
  description = "Storage container name"
  type        = string
}

variable "container_access_type" {
  description = "Storage container access type"
  type        = string
}

#############################
# Azure Container Registry
#############################

variable "acr_sku" {
  description = "Azure Container Registry SKU"
  type        = string
}

variable "image_name" {
  description = "Docker image name"
  type        = string
}

#############################
# Azure Container App
#############################

variable "aca_env_workload_profile_type" {
  description = "ACA Environment workload profile type"
  type        = string
}

variable "aca_workload_profile_type" {
  description = "ACA Environment workload profile type"
  type        = string
}

#############################
# Azure Kubernetes Service
#############################

variable "aks_node_pool_name" {
  description = "AKS node pool name"
  type        = string
}

variable "aks_node_pool_count" {
  description = "AKS node count"
  type        = number
}

variable "aks_node_pool_size" {
  description = "AKS node VM size"
  type        = string
}

variable "aks_node_pool_disk_type" {
  description = "AKS OS disk type"
  type        = string
}