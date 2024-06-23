module "vpc" {
  source = "./modules/vpc"

  projeto                    = var.projeto
  azs                        = var.azs
  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  any-ip                     = var.any-ip
  gateway_vpc_name           = var.gateway_vpc_name
}

module "alb" {
  source = "./modules/alb"

  projeto          = var.projeto
  vpc_id           = module.vpc.vpc-id
  public_subnet_id = module.vpc.public_subnet
}

module "asg-ecs" {
  source = "./modules/asg-ecs"

  projeto          = var.projeto
  vpc_id           = module.vpc.vpc-id
  alb_sg_id        = module.alb.alb_sg_id
  any_ip           = var.any-ip
  ecs_ami          = var.ecs_ami
  lt_instance_type = var.lt_instance_type
  asg_min_size     = var.asg_min_size
  asg_max_size     = var.asg_max_size
  desired_capacity = var.desired_capacity
  private_subnets  = module.vpc.private_subnet
  tg_arn           = module.alb.tg_arn
}