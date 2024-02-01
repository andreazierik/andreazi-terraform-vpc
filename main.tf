terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.34.0"
    }
  }
}

# module "ecr" {
#   source        = "./modules/ecr"
#   ecr_repo_name = local.ecr_repo_name
# }