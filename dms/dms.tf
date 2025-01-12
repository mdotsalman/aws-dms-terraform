module "dms" {
  source = "../modules/dms/"

  # SUBNET GROUP
  repl_subnet_group_name        = "${local.name}-${var.visibility}-subnet-group"
  repl_subnet_group_description = "DMS Subnet group for ${local.name} ${var.visibility}"
  repl_subnet_group_subnet_ids  = data.aws_subnets.public.ids
  repl_subnet_group_tags        = var.tags
}

