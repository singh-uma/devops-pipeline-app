module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}
module "ec2" {
  source = "./modules/ec2"

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_ids[0]
  ami_id    = var.ec2_ami_id
  key_name  = var.ec2_key_name

  instance_type = var.ec2_instance_type
}
module "rds" {
  source = "./modules/rds"

  identifier = var.rds_identifier
  db_name    = var.rds_db_name
  username   = var.rds_username
  password   = var.rds_password

  subnet_ids = module.vpc.private_subnet_ids
  vpc_id     = module.vpc.vpc_id

  instance_class = var.rds_instance_class
}
module "s3" {
  source = "./modules/s3"

  bucket_name = var.s3_bucket_name
}
