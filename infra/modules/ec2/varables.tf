# modules/ec2/variables.tf

variable "vpc_id" {
  description = "VPC ID where the EC2 instance will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access"
  type        = string
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

variable "availability_zone" {
  description = "Availability zone for the subnets and resources"
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
