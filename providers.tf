terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  # backend "s3" {
  #   bucket         = "aliquot-terraform-state"
  #   key            = "static-site/terraform.tfstate"
  #   region         = "us-east-1"
  # }
}


provider "aws" {
  region = "us-east-1"
}
