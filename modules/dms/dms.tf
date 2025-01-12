#SUBNET GROUP
module "subnet_group" {
  source = "./subnet-group"

  repl_subnet_group_name        = var.repl_subnet_group_name
  repl_subnet_group_description = var.repl_subnet_group_description
  repl_subnet_group_subnet_ids  = var.repl_subnet_group_subnet_ids
  repl_subnet_group_tags        = var.repl_subnet_group_tags
}

# REPLICATION INSTANCE
module "replication_instance" {
  source = "./replication-instance"

  repl_instance_allocated_storage            = var.repl_instance_allocated_storage
  repl_instance_allow_major_version_upgrade  = false
  repl_instance_apply_immediately            = true
  repl_instance_auto_minor_version_upgrade   = true
  repl_instance_availability_zone            = var.repl_instance_availability_zone
  repl_instance_engine_version               = var.repl_instance_engine_version
  repl_instance_kms_key_arn                  = var.repl_instance_kms_key_arn
  repl_instance_multi_az                     = var.repl_instance_multi_az
  repl_instance_network_type                 = "IPV4"
  repl_instance_preferred_maintenance_window = "sun:01:00-sun:03:00"
  repl_instance_publicly_accessible          = true
  repl_instance_class                        = var.repl_instance_class
  repl_instance_id                           = var.repl_instance_id
  repl_instance_subnet_group_id              = module.subnet_group.id
  repl_instance_vpc_security_group_ids       = var.repl_instance_vpc_security_group_ids
  repl_instance_tags                         = var.repl_instance_tags
  repl_instance_timeouts = {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}

