
# Security Group for RDS instance
resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.db_name}-sg"
  }
}

# Subnet Group for RDS instance
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_name}-subnet-group"
  }
}

# Parameter Group for RDS instance
resource "aws_db_parameter_group" "rds_parameter_group" {
  name        = "${var.db_name}-parameter-group"
  family      = var.db_parameter_group_family
  description = "Parameter group for ${var.db_name}"

  parameter {
    name  = "max_connections"
    value = var.db_max_connections
  }

  tags = {
    Name = "${var.db_name}-parameter-group"
  }
}

# RDS instance
resource "aws_db_instance" "rds_instance" {
  identifier              = var.db_identifier
  allocated_storage       = var.db_allocated_storage
  storage_type            = var.db_storage_type
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
 # name                    = var.db_name
  username                = var.db_username
  password                = var.db_password
  parameter_group_name    = aws_db_parameter_group.rds_parameter_group.name
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  multi_az                = var.db_multi_az
  publicly_accessible     = var.db_publicly_accessible
  skip_final_snapshot     = var.db_skip_final_snapshot
  backup_retention_period = var.db_backup_retention_period

  tags = {
    Name = "${var.db_name}-instance"
  }
}
