variable "env" {
  type        = string
  description = "Environment name (dev, staging, prod)"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}
