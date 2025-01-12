#SUBNET GROUP
module "subnet_group" {
  source = "./subnet-group/"

  repl_subnet_group_name        = var.repl_subnet_group_name
  repl_subnet_group_description = var.repl_subnet_group_description
  repl_subnet_group_subnet_ids  = var.repl_subnet_group_subnet_ids
  repl_subnet_group_tags        = var.repl_subnet_group_tags
}
