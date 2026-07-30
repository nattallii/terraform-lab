variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "name_prefix" {
  description = "Prefix used to generate Azure resource names"
  type        = string
}

# Redis

variable "redis_capacity" {
  description = "Capacity of the Azure Redis Cache instance"
  type        = number
}

variable "redis_sku" {
  description = "SKU name of the Azure Redis Cache instance"
  type        = string
}

variable "redis_sku_family" {
  description = "SKU family of the Azure Redis Cache instance"
  type        = string
}

variable "redis_primary_key_secret_name" {
  description = "Name of the Key Vault secret containing the Redis primary access key"
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "Name of the Key Vault secret containing the Redis hostname"
  type        = string
}

# Key Vault

variable "keyvault_sku" {
  description = "SKU name of the Azure Key Vault"
  type        = string
}

# ACR

variable "acr_sku" {
  description = "SKU of the Azure Container Registry"
  type        = string
}

variable "image_name" {
  description = "Name of the Docker image stored in Azure Container Registry"
  type        = string
}

# ACI

variable "aci_sku" {
  description = "SKU of the Azure Container Instance"
  type        = string
}

# AKS

variable "aks_node_pool_name" {
  description = "Name of the default AKS node pool"
  type        = string
}

variable "aks_node_pool_count" {
  description = "Number of nodes in the default AKS node pool"
  type        = number
}

variable "aks_node_pool_size" {
  description = "Virtual machine size used by nodes in the default AKS node pool"
  type        = string
}

variable "aks_node_pool_disk_type" {
  description = "OS disk type used by nodes in the default AKS node pool"
  type        = string
}

# Common

variable "student_email" {
  description = "Student email used as the Creator tag value"
  type        = string
}

variable "git_pat" {
  description = "Personal Access Token used by the ACR Task to access the source code repository"
  type        = string
  sensitive   = true
}


variable "context_path" {
  description = "Git repository URL used as the build context for the ACR Task"
  type        = string
}