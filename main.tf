data "http" "casa-public-ip" {
  url = "https://ifconfig.me/ip"
}

module "codecommit" {
  source = "./modules/codecommit"

  repo-app-name     = var.repo-app-name
  repo-default-desc = var.repo-default-desc
}

module "vpc" {
  source = "./modules/vpc"

  azs                        = var.azs
  name                       = var.name
  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  any-ip                     = var.any-ip
}