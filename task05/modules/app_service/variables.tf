variable "name" {
  type = string
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "tags" {

  type = map(string)

}


variable "resource_group_name" {
  type = string
}

variable "service_plan_id" {
  type = string
}

variable "allowed_ip_address" {
  type = string
}

variable "allow_ip_rule_name" {
  type = string
}

variable "allow_tag_rule_name" {
  type = string
}