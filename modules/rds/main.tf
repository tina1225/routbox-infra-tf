resource "aws_db_subnet_group" "this" {
  name       = "${var.env}-shipments-api"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.env}-shipments-api"
    Env  = var.env
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.env}-shipments-api-rds"
  description = "Allow PostgreSQL access from EKS nodes"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.allowed_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-shipments-api-rds"
    Env  = var.env
  }
}

resource "aws_db_instance" "this" {
  identifier        = "${var.env}-shipments-api"
  engine            = "postgres"
  engine_version    = "16"
  instance_class    = var.instance_class
  allocated_storage = 20

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  skip_final_snapshot = true
  publicly_accessible = false

  tags = {
    Name = "${var.env}-shipments-api"
    Env  = var.env
  }
}
