variable "identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "username" {
  description = "Master username"
  type        = string
}

variable "password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "Private subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}
