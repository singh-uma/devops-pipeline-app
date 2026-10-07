output "instance_id" {
  description = "ID of the DevOps EC2 instance"
  value       = aws_instance.main.id
}

output "public_ip" {
  description = "Public IP address of the DevOps EC2 instance"
  value       = aws_instance.main.public_ip
}

output "public_dns" {
  description = "Public DNS name of the DevOps EC2 instance"
  value       = aws_instance.main.public_dns
}

output "security_group_id" {
  description = "Security group ID of the DevOps EC2 instance"
  value       = aws_security_group.ec2.id
}
