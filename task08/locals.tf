locals {
  rg_name       = "${var.name_prefix}-rg"
  aci_name      = "${var.name_prefix}-ci"
  aks_name      = "${var.name_prefix}-aks"
  acr_name      = "${replace(var.name_prefix, "-", "")}cr"
  keyvault_name = "${var.name_prefix}-kv"
  redis_name    = "${var.name_prefix}-redis"

  tags = {
    Creator = var.student_email
  }
}