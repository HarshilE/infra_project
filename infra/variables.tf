variable "aws_region" {
    description = "Region of AWS"
    default = ap-south-1
    type = string
}
variable "vpc_cidr" {
    description = "VPC cidr range"
    type = string
    default = "10.20.30.76"
}
variable "public_subnets" {
    description = "A list of public subnet CIDR blocks"
    type = list(string)
    default = "[10.30.20.32, 10.30.20.32]"
}
variable "private_subnets" {
  description = "A list of private subnet CIDR blocks"
  type        = list(string)
}