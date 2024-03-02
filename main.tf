data "http" "casa-public-ip" {
  url = "https://ifconfig.me/ip"
}

module "vpc" {
  source = "./modules/vpc"
  azs    = var.aws_azs
  name   = var.empresa
}