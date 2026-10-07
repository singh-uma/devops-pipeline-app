variable "vpc_cidr" {
  description = "CIDR block for the DevOps project VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}

variable "availability_zones" {
  description = "Availability zones for the DevOps project"
  type        = list(string)
  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}
variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "ec2_key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
variable "rds_identifier" {
  description = "RDS instance identifier"
  type        = string
  default     = "devops-mysql"
}

variable "rds_db_name" {
  description = "Initial MySQL database name"
  type        = string
  default     = "devopsdb"
}

variable "rds_username" {
  description = "MySQL master username"
  type        = string
  default     = "admin"
}

variable "rds_password" {
  description = "MySQL master password"
  type        = string
  sensitive   = true
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}
variable "s3_bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
}
