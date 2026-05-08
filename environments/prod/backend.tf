terraform {
  backend "s3" {
    bucket  = "routbox-terraform-state-prod"
    key     = "prod/network/terraform.tfstate"
    region  = "us-east-1"
    profile = "prod"
  }
}
