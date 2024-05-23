module "vpc" {
    source = "./modules/vpc/"
    vpc_cidr = var.vpc_cidr
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
    vpc_name = var.vpc_name
    availability_zone = var.availability_zone
}
