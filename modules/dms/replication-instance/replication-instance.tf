################################################################################
# Instance
################################################################################

resource "aws_dms_replication_instance" "this" {
  count = var.create && var.create_repl_instance ? 1 : 0

  allocated_storage            = var.repl_instance_allocated_storage
  allow_major_version_upgrade  = var.repl_instance_allow_major_version_upgrade
  apply_immediately            = var.repl_instance_apply_immediately
  auto_minor_version_upgrade   = var.repl_instance_auto_minor_version_upgrade
  availability_zone            = var.repl_instance_availability_zone
  engine_version               = var.repl_instance_engine_version
  kms_key_arn                  = var.repl_instance_kms_key_arn
  multi_az                     = var.repl_instance_multi_az
  network_type                 = var.repl_instance_network_type
  preferred_maintenance_window = var.repl_instance_preferred_maintenance_window
  publicly_accessible          = var.repl_instance_publicly_accessible
  replication_instance_class   = var.repl_instance_class
  replication_instance_id      = var.repl_instance_id
  replication_subnet_group_id  = var.repl_instance_subnet_group_id
  vpc_security_group_ids       = var.repl_instance_vpc_security_group_ids

  tags = var.repl_instance_tags

  timeouts {
    create = try(var.repl_instance_timeouts.create, null)
    update = try(var.repl_instance_timeouts.update, null)
    delete = try(var.repl_instance_timeouts.delete, null)
  }
}
