variable "env" {
  type    = string
  default = "dev"
}

variable "vpc_cidr" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "db_password" {
  type      = string
  sensitive = true
}
