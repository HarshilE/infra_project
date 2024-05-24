#calling VPC Module
#==================================================
module "vpc" {
    source = "./modules/vpc/"
    vpc_cidr = var.vpc_cidr
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
    vpc_name = var.vpc_name
    availability_zone = var.availability_zone
}

# Call the EC2 module
module "ec2" {
  source = "./modules/ec2"

  vpc_id                  = module.vpc.vpc_id
  subnet_id               = module.vpc.public_subnet_id
  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  key_name                = var.key_name
  public_key              = var.public_key
  ec2_name                = var.ec2_name
  allowed_ssh_cidr_blocks = var.allowed_ssh_cidr_blocks
  placement_group_name    = var.placement_group_name
  placement_group_strategy = var.placement_group_strategy
  dedicated_host_instance_type = var.dedicated_host_instance_type
  availability_zone       = var.availability_zone
  volume_size             = var.volume_size
  device_name             = var.device_name
  asg_min_size            = var.asg_min_size
  asg_max_size            = var.asg_max_size
  asg_desired_capacity    = var.asg_desired_capacity
}
