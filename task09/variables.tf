variable "rg_name" {
  description = "name of resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "naming_prefix" {
  description = "Prefix used to generate Azure resource names"
  type        = string
}


variable "virtual_network_name" {
  description = "Name of the existing Azure Virtual Network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space of the existing Azure Virtual Network."
  type        = string
}

variable "aks_subnet_name" {
  description = "Name of the existing subnet where the AKS cluster is deployed."
  type        = string
}

variable "aks_cluster_name" {
  description = "Name of the existing Azure Kubernetes Service (AKS) cluster."
  type        = string
}

variable "aks_load_balancer_ip" {
  description = "Public IP address assigned to the AKS load balancer."
  type        = string
}

variable "firewall_public_ip_name" {
  description = "Name of the Azure Public IP resource used by Azure Firewall."
  type        = string
}

variable "firewall_subnet_prefix" {
  description = "firewall subnet prefix"
  type        = string
}

