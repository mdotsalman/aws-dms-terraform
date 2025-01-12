module "dms" {
  source = "../modules/dms/"

  # SUBNET GROUP
  repl_subnet_group_name        = "${local.name}-${var.visibility}-subnet-group"
  repl_subnet_group_description = "DMS Subnet group for ${local.name} ${var.visibility}"
  repl_subnet_group_subnet_ids  = data.aws_subnets.public.ids
  repl_subnet_group_tags        = var.tags

  # REPLICATION INSTANCE
  repl_instance_allocated_storage            = 100
  repl_instance_availability_zone            = "us-east-1a"
  repl_instance_engine_version               = "3.4.5"
  repl_instance_kms_key_arn                  = "arn:aws:kms:us-east-1:123456789012:key/abc123"
  repl_instance_multi_az                     = false
  repl_instance_class                        = "dms.r5.large"
  repl_instance_id                           = "${local.name}-replication-instance"
  repl_instance_vpc_security_group_ids       = ["sg-12345678"]
  repl_instance_tags = var.tags
}

