locals {
  data             = yamldecode(file("./config.yml"))
  virtual_machines = { for virtual_machine in local.data.ec2 : virtual_machine.name => virtual_machine }
}