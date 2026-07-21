variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "creator_tag" {
  type        = string
  description = "Creator tag"
}


variable "vnet_name" {
  type        = string
  description = "Virtual Network name"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "nic_name" {
  type        = string
  description = "Network Interface name"
}

variable "nsg_name" {
  type        = string
  description = "Network Security Group name"
}

variable "http_rule_name" {
  type        = string
  description = "HTTP inbound rule name"
}

variable "ssh_rule_name" {
  type        = string
  description = "SSH inbound rule name"
}

variable "public_ip_name" {
  type        = string
  description = "Public IP name"
}

variable "dns_name_label" {
  type        = string
  description = "DNS name label"
}

variable "vm_name" {
  type        = string
  description = "Virtual Machine name"
}

variable "vm_size" {
  type        = string
  description = "Virtual Machine size"
}

variable "vm_image" {
  type        = string
  description = "Ubuntu image SKU"
}

variable "vm_username" {
  type        = string
  description = "VM username"
}

variable "vm_password" {
  description = "Administrator password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "ip_configuration_name" {
  type        = string
  description = "Network interface IP configuration name"
}

variable "private_ip_address_allocation" {
  type        = string
  description = "private ip address allocation"
}