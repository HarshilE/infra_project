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