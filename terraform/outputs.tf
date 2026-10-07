output "vpc_id" {
  description = "ID of the DevOps project VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}
output "ec2_instance_id" {
  description = "ID of the DevOps EC2 instance"
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "Public IP address of the DevOps EC2 instance"
  value       = module.ec2.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS name of the DevOps EC2 instance"
  value       = module.ec2.public_dns
}

output "ec2_security_group_id" {
  description = "Security group ID of the DevOps EC2 instance"
  value       = module.ec2.security_group_id
}
