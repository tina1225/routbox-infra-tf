resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "routbox-${var.env}-vpc"
    Env  = var.env
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "routbox-${var.env}-igw"
    Env  = var.env
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "routbox-${var.env}-nat-eip"
    Env  = var.env
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "routbox-${var.env}-nat"
    Env  = var.env
  }

  depends_on = [aws_internet_gateway.main]
}
