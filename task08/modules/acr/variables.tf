variable "name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the Azure Container Registry will be created"
  type        = string
}

variable "location" {
  description = "Azure region where the Azure Container Registry will be created"
  type        = string
}

variable "sku" {
  description = "SKU of the Azure Container Registry"
  type        = string
}

variable "image_name" {
  description = "Name of the Docker image built and stored in the Azure Container Registry"
  type        = string
}



variable "context_path" {
  description = "Git repository URL used as the Docker build context by the Azure Container Registry Task"
  type        = string
}

variable "git_pat" {
  description = "Personal Access Token used by the Azure Container Registry Task to access the source code repository"
  type        = string
  sensitive   = true
}



variable "tags" {
  description = "Tags to assign to the Azure Container Registry"
  type        = map(string)
  default     = {}
}