variable "name" {
  description = "Name of the Azure Kubernetes Service cluster"
  type        = string
}

variable "location" {
  description = "Azure region where the AKS cluster will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the AKS cluster will be created"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the default AKS node pool"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the default AKS node pool"
  type        = number
}

variable "vm_size" {
  description = "Virtual machine size used by nodes in the default AKS node pool"
  type        = string
}

variable "os_disk_type" {
  description = "OS disk type used by nodes in the default AKS node pool"
  type        = string
}

variable "acr_id" {
  description = "ID of the Azure Container Registry that AKS is allowed to pull images from"
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Azure Key Vault that AKS is allowed to access"
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID used by the Key Vault access policy"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the Azure Kubernetes Service cluster"
  type        = map(string)
}

variable "dns_prefix" {
  description = "DNS prefix used for the AKS cluster API server"
  type        = string
}