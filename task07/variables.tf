variable "location" {
  description = "Azure region where the resources will be deployed."
  type        = string
}

variable "rg_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}



variable "sa_name" {
  description = "Name of the Azure Storage Account."
  type        = string
}


variable "blob_file" {
  description = "Name of the file stored as a blob in the Storage Account."
  type        = string
}

variable "fd_profile_name" {
  description = "Name of the Azure Front Door CDN profile."
  type        = string
}

variable "fd_profile_sku" {
  description = "SKU of the Azure Front Door CDN profile."
  type        = string
}

variable "fd_endpoint_name" {
  description = "Name of the Azure Front Door CDN endpoint."
  type        = string
}

variable "fd_origin_group_name" {
  description = "Name of the Azure Front Door origin group."
  type        = string
}

variable "fd_origin_name" {
  description = "Name of the Azure Front Door origin."
  type        = string
}

variable "fd_route_name" {
  description = "Name of the Azure Front Door route."
  type        = string
}