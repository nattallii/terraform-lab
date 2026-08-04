variable "rg_name" {
  description = "Existing Resource Group name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "virtual_network_name" {
  description = "Existing Virtual Network name."
  type        = string
}

variable "firewall_public_ip_name" {
  description = "Azure Firewall Public IP resource name."
  type        = string
}

variable "naming_prefix" {
  description = "Naming prefix for Azure resources."
  type        = string
}

variable "aks_subnet_name" {
  description = "aks subnet name"
  type        = string
}



variable "aks_load_balancer_public_ip" {
  description = "AKS lb ip"
  type        = string
}

variable "firewall_subnet_prefix" {
  description = "firewall subnet prefix"
  type        = string
}