resource "random_string" "random_string" {
  length  = 4
  special = false
  lower   = true
  upper   = false
}

module "main" {
  source                      = "./.."
  for_each                    = local.virtual_machines
  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  associate_public_ip_address = each.value.associate_public_ip_address
  availability_zone           = each.value.availability_zone
  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = each.value.vpc_security_group_ids
  key_name                    = each.value.key_name
  iam_instance_profile        = each.value.iam_instance_profile
  disable_api_termination     = each.value.disable_api_termination
  global                      = var.global
}