terraform {
  backend "s3" {
    bucket  = "routbox-terraform-state"
    key     = "staging/network/terraform.tfstate"
    region  = "us-east-1"
    profile = "staging"
  }
}
