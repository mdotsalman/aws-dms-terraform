################################################################################
# Subnet group
################################################################################

variable "create_repl_subnet_group" {
  description = "Determines whether the replication subnet group will be created"
  type        = bool
  default     = true
}

variable "repl_subnet_group_description" {
  description = "The description for the subnet group"
  type        = string
  default     = null
}

variable "repl_subnet_group_name" {
  description = "The name for the replication subnet group. Stored as a lowercase string, must contain no more than 255 alphanumeric characters, periods, spaces, underscores, or hyphens"
  type        = string
  default     = null
}

variable "repl_subnet_group_subnet_ids" {
  description = "A list of the EC2 subnet IDs for the subnet group"
  type        = list(string)
  default     = []
}

variable "repl_subnet_group_tags" {
  description = "A map of additional tags to apply to the replication subnet group"
  type        = map(string)
  default     = {}
}
