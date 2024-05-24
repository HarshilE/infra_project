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
#====================================================

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

# call the RDS module
#=====================================================

module "RDS" {
  source = "./modules/rds"

  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.public_subnet_ids
  db_identifier           = var.db_identifier
  db_allocated_storage    = var.db_allocated_storage
  db_storage_type         = var.db_storage_type
  db_engine               = var.db_engine
  db_engine_version       = var.db_engine_version
  db_instance_class       = var.db_instance_class
  db_name                 = var.db_name
  db_username             = var.db_username
  db_password             = var.db_password
  db_parameter_group_family = var.db_parameter_group_family
  db_max_connections      = var.db_max_connections
  db_multi_az             = var.db_multi_az
  db_publicly_accessible  = var.db_publicly_accessible
  db_skip_final_snapshot  = var.db_skip_final_snapshot
  db_backup_retention_period = var.db_backup_retention_period
  db_port                 = var.db_port
  allowed_cidr_blocks     = var.allowed_cidr_blocks
}

