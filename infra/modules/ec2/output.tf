output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.main.id
}

output "eip" {
  description = "Elastic IP of the EC2 instance"
  value       = aws_eip.ec2_eip.public_ip
}
