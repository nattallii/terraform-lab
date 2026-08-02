variable "name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "container_name" {
  description = "Name of the Azure Storage container"
  type        = string
}



variable "location" {
  description = "Azure region where the Azure Storage Account will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the Azure Redis Cache instance will be created"
  type        = string
}


variable "replication_type" {
  description = "Account replication type"
  type        = string
}

variable "access_type" {
  description = "Container Access Type"
  type        = string
}


variable "tags" {
  description = "Tags to assign to the Azure Redis Cache instance"
  type        = map(string)
}
