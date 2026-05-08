terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.env
}

module "network" {
  source = "../../modules/network"

  env      = var.env
  vpc_cidr = var.vpc_cidr
  region   = var.region
}
