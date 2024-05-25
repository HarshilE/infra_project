#vpc outputs
#===============================================================
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "The public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "The private subnets"
  value       = module.vpc.private_subnets
}
#EC2 outputs
#===================================================================

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.main.id
}

output "eip" {
  description = "Elastic IP of the EC2 instance"
  value       = aws_eip.ec2_eip.public_ip
}

#RDS outputs
#======================================================================

output "rds_instance_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = module.rds.rds_instance_endpoint
}

output "rds_instance_id" {
  description = "ID of the RDS instance"
  value       = module.rds.rds_instance_id
}

#S3 outputs
#=========================================================================

output "general_purpose_bucket_arn" {
  description = "ARN of the general purpose S3 bucket"
  value       = module.s3.general_purpose_bucket_arn
}

output "directory_bucket_arn" {
  description = "ARN of the directory S3 bucket"
  value       = module.s3.directory_bucket_arn
}
