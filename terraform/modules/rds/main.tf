resource "aws_db_subnet_group" "main" {
  name       = "${var.identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.identifier}-subnet-group"
    Environment = "dev"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.identifier}-rds-sg"
  description = "Security group for RDS MySQL"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MySQL from VPC"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks     = ["10.0.0.0/16"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.identifier}-rds-sg"
    Environment = "dev"
  }
}

resource "aws_db_instance" "main" {
  identifier = var.identifier

  engine         = "mysql"
  engine_version = "8.0"

  instance_class        = var.instance_class
  allocated_storage     = 20
  max_allocated_storage = 20
  storage_type          = "gp3"

  db_name  = var.db_name
  username = var.username
  password = var.password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible    = false
  skip_final_snapshot    = true
  deletion_protection    = false

  backup_retention_period = 0

  tags = {
    Name        = var.identifier
    Environment = "dev"
  }
}
