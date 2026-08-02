variable "acr_login_server" {
  description = "Azure Container Registry login server"
  type        = string
}

variable "image_name" {
  description = "Name of the Docker image stored in Azure Container Registry"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "latest"
}

variable "aks_kv_access_identity_id" {
  description = "Client ID of the AKS user-assigned managed identity used to access Azure Key Vault"
  type        = string
}

variable "kv_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory tenant ID"
  type        = string
}

variable "redis_url_secret_name" {
  description = "Name of the Azure Key Vault secret containing the Redis hostname"
  type        = string
}

variable "redis_password_secret_name" {
  description = "Name of the Azure Key Vault secret containing the Redis password"
  type        = string
}