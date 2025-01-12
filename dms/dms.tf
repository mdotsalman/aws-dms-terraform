module "dms" {
  source = "../modules/dms/"

  # SUBNET GROUP
  repl_subnet_group_name        = "${local.name}-${var.visibility}-subnet-group"
  repl_subnet_group_description = "DMS Subnet group for ${local.name} ${var.visibility}"
  repl_subnet_group_subnet_ids  = data.aws_subnets.public.ids
  repl_subnet_group_tags        = var.tags

  # REPLICATION INSTANCE
  repl_instance_allocated_storage            = 100
  repl_instance_allow_major_version_upgrade  = false
  repl_instance_apply_immediately            = true
  repl_instance_auto_minor_version_upgrade   = true
  repl_instance_availability_zone            = "us-east-1a"
  repl_instance_engine_version               = "3.4.5"
  repl_instance_kms_key_arn                  = "arn:aws:kms:us-east-1:123456789012:key/abc123"
  repl_instance_multi_az                     = false
  repl_instance_network_type                 = "IPV4"
  repl_instance_preferred_maintenance_window = "sun:01:00-sun:03:00"
  repl_instance_publicly_accessible          = true
  repl_instance_class                        = "dms.r5.large"
  repl_instance_id                           = "${local.name}-replication-instance"
  repl_instance_vpc_security_group_ids       = ["sg-12345678"]

  repl_instance_tags = var.tags

  repl_instance_timeouts = {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}

