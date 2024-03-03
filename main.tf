data "http" "casa-public-ip" {
  url = "https://ifconfig.me/ip"
}

module "alb" {
  source = "./modules/alb"

  alb-sg-name      = var.alb-sg-name
  vpc-id           = module.vpc.vpc-id
  any-ip           = ["${data.http.casa-public-ip.response_body}/32"]
  tg-name          = var.tg-name
  alb-name         = var.alb-name
  public_subnet_id = module.vpc.public_subnet
}

module "asg" {
  source = "./modules/asg"

  ec2-sg-name     = var.ec2-sg-name
  vpc-id          = module.vpc.vpc-id
  alb-sg-id       = module.alb.sg-id
  lt-name         = var.lt-name
  ami-id          = var.ami-id
  sshkey          = var.sshkey
  public-subnets  = module.vpc.public_subnet
  asg-name        = var.asg-name
  tg-arn          = module.alb.tg-arn
  asg-policy      = var.asg-policy
  cw-name         = var.cw-name
  asg-policy-down = var.asg-policy-down
  cw-scaling-down = var.cw-scaling-down
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