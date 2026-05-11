variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "allowed_security_group_id" {
  type        = string
  description = "Security group ID allowed to connect (EKS node SG)"
}

variable "db_name" {
  type    = string
  default = "shipments"
}

variable "db_username" {
  type    = string
  default = "shipments_user"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}
