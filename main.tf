module "vpc" {
  source = "./modules/vpc"

  name                       = var.projeto
  azs                        = var.azs
  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  any-ip                     = var.any-ip
}