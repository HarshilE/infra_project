# modules/rds/variables.tf

variable "vpc_id" {
  description = "VPC ID where the RDS instance will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the RDS instance"
  type        = list(string)
}

variable "db_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage in GB for the RDS instance"
  type        = number
}

variable "db_storage_type" {
  description = "Storage type for the RDS instance"
  type        = string
  default     = "gp2"
}

variable "db_engine" {
  description = "Database engine for the RDS instance"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version for the RDS instance"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Database name for the RDS instance"
  type        = string
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_parameter_group_family" {
  description = "Parameter group family for the RDS instance"
  type        = string
}

variable "db_max_connections" {
  description = "Maximum number of connections for the RDS instance"
  type        = string
  default     = "100"
}

variable "db_multi_az" {
  description = "Whether to create a Multi-AZ RDS instance"
  type        = bool
  default     = false
}

variable "db_publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
  default     = false
}

variable "db_skip_final_snapshot" {
  description = "Whether to skip taking a final snapshot before deleting the RDS instance"
  type        = bool
  default     = true
}

variable "db_backup_retention_period" {
  description = "The backup retention period in days"
  type        = number
  default     = 7
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = 3306
}

variable "allowed_cidr_blocks" {
  description = "List of allowed CIDR blocks for RDS access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
