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
#ec2 variables
# modules/ec2/variables.tf

# root variables.tf

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
