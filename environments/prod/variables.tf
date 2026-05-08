variable "env" {
  type    = string
  default = "prod"
}

variable "vpc_cidr" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}
