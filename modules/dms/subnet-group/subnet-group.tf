################################################################################
# Subnet group
################################################################################

resource "aws_dms_replication_subnet_group" "this" {
  count = var.create && var.create_repl_subnet_group ? 1 : 0

  replication_subnet_group_id          = lower(var.repl_subnet_group_name)
  replication_subnet_group_description = var.repl_subnet_group_description
  subnet_ids                           = var.repl_subnet_group_subnet_ids

  tags = merge(var.tags, var.repl_subnet_group_tags)
}
