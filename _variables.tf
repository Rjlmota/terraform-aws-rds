variable "name" {
  type        = string
  description = "Name of this RDS Database"
}

variable "environment_name" {
  type        = string
  description = "Environment name to use as a prefix to this DB"
}

variable "db_type" {
  type        = string
  description = "Valid values are: rds, aurora or serverless"
}

variable "iam_database_authentication_enabled" {
  type    = bool
  default = false
}

variable "allow_security_group_ids" {
  type        = list(string)
  description = "List of Security Group IDs to allow connection to this DB"
  default     = []
}

variable "allow_cidrs" {
  type        = list(string)
  default     = []
  description = "List of CIDRs to allow connection to this DB"
}

variable "user" {
  type        = string
  description = "DB User"
}

variable "retention" {
  type        = number
  description = "Snapshot retention period in days"
}

variable "instance_class" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type    = string
  default = ""
}

variable "port" {
  type        = number
  description = "Port number for this DB (usually 3306 for MySQL and 5432 for Postgres)"
}

#variable "parameter_group_name" {
#  type        = string
#  description = "Parameter group name for this DB"
#}

variable "apply_immediately" {
  type        = bool
  default     = true
  description = "Apply changes immediately or wait for the maintainance window"
}

variable "skip_final_snapshot" {
  type        = bool
  default     = false
  description = "Skips the final snapshot if the database is destroyed programatically"
}


variable "snapshot_identifier" {
  type        = string
  default     = ""
  description = "Pass a snapshot identifier for the database to be created from this snapshot"
}

variable "final snapshot_identifier" {
  type        = string
  default     = ""
  description = "Pass afinal  snapshot identifier"
}

variable "identifier" {
  type        = string
  default     = ""
  description = "Optional identifier for DB. If not passed, {environment_name}-{name} will be used"
}

variable "database_name" {
  description = "Database Name"
  type        = string
  default     = ""
}


variable "allocated_storage" {
  type        = number
  description = "Storage size in GB"
  default     = null
}

variable "storage_encrypted" {
  type        = bool
  description = "Enables storage encryption"
}

variable "kms_key_arn" {
  type        = string
  default     = ""
  description = "KMS Key ARN to use a CMK instead of default shared key, when storage_encrypted is true"
}

variable "backup" {
  type        = bool
  description = "Enables automatic backup with AWS Backup"
}

variable "vpc_id" {
  type = string
}

variable "create_db_subnet_group" {
  description = "Create a Subnet group?"
  default     = false
}

variable "db_subnet_group_id" {
  description = "RDS Subnet Group Name"
  type        = string
}

variable "db_subnet_group_subnet_ids" {
  type        = list(any)
  description = "List of Subnet IDs for the RDS Subnet Group"
  default     = []
}

variable "preferred_backup_window" {
  description = "Preferred Backup Window"
  type        = string
  default     = "07:00-09:00"
}

variable "count_aurora_instances" {
  description = "Number of Aurora Instances"
  type        = number
  default     = "1"
}

# DB and Cluster parameter group
variable "create_cluster_parameter_group" {
  description = "Whether to create a cluster parameter group"
  type        = bool
  default     = false
}

variable "cluster_parameters" {
  description = "A list of Cluster parameters (map) to apply"
  type        = list(map(string))
  default     = []
}

variable "create_db_parameter_group" {
  description = "Whether to create a database parameter group"
  type        = bool
  default     = false
}

variable "db_parameters" {
  description = "A list of DB parameters (map) to apply"
  type        = list(map(string))
  default     = []
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate or create"
  type        = string
  default     = null
}

#variable "use_name_prefix" {
#  description = "Determines whether to use `parameter_group_name` as is or create a unique name beginning with `parameter_group_name` as the specified prefix"
#  type        = bool
#  default     = true
#}

variable "parameter_group_description" {
  description = "The description of the DB parameter group"
  type        = string
  default     = "Managed by Terraform"
}

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = ""
}

# DB option group
variable "create_db_option_group" {
  description = "(Optional) Create a database option group"
  type        = bool
  default     = true
}

variable "option_group_name" {
  description = "Name of the option group"
  type        = string
  default     = null
}

variable "option_group_use_name_prefix" {
  description = "Determines whether to use `option_group_name` as is or create a unique name beginning with the `option_group_name` as the prefix"
  type        = bool
  default     = true
}

variable "option_group_description" {
  description = "The description of the option group"
  type        = string
  default     = "Managed by Terraform"
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
  default     = ""
}

variable "options" {
  description = "A list of Options to apply."
  type        = any
  default     = []
}


variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}


variable "multi_az" {
  description = "Deploy multi-az instance database"
  type        = bool
  default     = false
}


variable "performance_insights_enabled" {
  description = "Enable performance insights on instance"
  type        = bool
  default     = false
}


variable "max_allocated_storage" {
  type        = number
  description = "Argument higher than the allocated_storage to enable Storage Autoscaling, size in GB. 0 to disable Storage Autoscaling"
  default     = 0
}

variable "secret_method" {
  description = "Use ssm for SSM parameters store which is the default option, or secretsmanager for AWS Secrets Manager"
  type        = string
  default     = "ssm"
}
