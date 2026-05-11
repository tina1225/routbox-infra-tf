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

module "eks" {
  source = "../../modules/eks"

  cluster_name       = var.env
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
}
module "shipments_api_ecr" {
 source = "../../modules/ecr"

 name = "routebox-shipments-api"
}

module "rds" {
  source = "../../modules/rds"

  env                       = var.env
  vpc_id                    = module.network.vpc_id
  subnet_ids                = module.network.private_subnet_ids
  allowed_security_group_id = module.eks.cluster_security_group_id
  db_password               = var.db_password
}