locals {
  rg_name = "${var.name_prefix}-rg"

  redis_aci_name = "${var.name_prefix}-redis-ci"

  sa_name = replace("${var.name_prefix}sa", "-", "")

  acr_name = replace("${var.name_prefix}cr", "-", "")

  keyvault_name = "${var.name_prefix}-kv"

  aca_env_name = "${var.name_prefix}-cae"

  aca_name = "${var.name_prefix}-ca"

  aks_name = "${var.name_prefix}-aks"

  tags = {
    Creator = var.student_email
  }
}