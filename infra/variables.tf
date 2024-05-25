###################################################################################################
#VPC variables
#==========================================================================
variable "aws_region" {
    description = "Region of AWS"
    default = "ap-south-1"
    type = string
}
variable "vpc_cidr" {
    description = "VPC cidr range"
    type = string
    default = "10.20.30.76/16"
}
variable "vpc_name" {
  description = "Name of the VPC"
  default = "User_vpc/ famo-money"
  type        = string
}
variable "public_subnets" {
    description = "A list of public subnet CIDR blocks"
    type = list(string)
    default = ["10.30.20.32/24", "10.30.20.32/24"]
}
variable "private_subnets" {
  description = "A list of private subnet CIDR blocks"
  type        = list(string)
  default = ["10.10.20.32/24", "10.20.20.32/24"]
}
variable "availability_zone" {
  description = "availablity of the project"
  type = string
  default = "ap-south-1a"
}

##################################################################
#EC2 variables
#=================================================================

variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-west-2"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default = "ami-943884343"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Key name for SSH access"
  type        = string
  default = "c2-key"
}

variable "public_key" {
  description = "Public key material for the key pair"
  type        = string
}

variable "ec2_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "allowed_ssh_cidr_blocks" {
  description = "CIDR blocks allowed to SSH into the EC2 instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "placement_group_name" {
  description = "Name of the placement group"
  type        = string
}

variable "placement_group_strategy" {
  description = "Placement group strategy (cluster, spread, partition)"
  type        = string
  default     = "cluster"
}

variable "dedicated_host_instance_type" {
  description = "Instance type for the dedicated host"
  type        = string
}

variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
}

variable "device_name" {
  description = "Device name for the volume attachment"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the Auto Scaling group"
  type        = number
}

####################################################################################################################
#RDS variables
#====================================================================================================================

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

####################################################################################################################
#S3 variables
#====================================================================================================================

variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-west-2"
}

variable "general_purpose_bucket_name" {
  description = "Name for the general purpose S3 bucket"
  type        = string
}

variable "directory_bucket_name" {
  description = "Name for the directory S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment in which the resources are deployed (e.g., dev, prod)"
  type        = string
}
