terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.34.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~>3.4.0"
    }
  }
  backend "s3" {
    bucket         = "andreazierik-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "andreazierik-terraform-state-lock-table"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Provisioner = "Terraform"
    }
  }
}