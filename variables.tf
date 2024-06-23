variable "projeto" {
  type        = string
  description = "VPC name"
}

variable "azs" {
  type        = list(string)
  description = "Default AZs for this configuration"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Default CIDR for AWS VPC"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "Default CIDR for public subnets"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "Default CIDR for private subnets"
}

variable "any-ip" {
  type        = string
  description = "IP corringa"
}

variable "gateway_vpc_name" {
  type        = string
  description = "Service name"
}

variable "ecs_ami" {
  type        = string
  description = "Amazon Linux ECS optimized"
}

variable "lt_instance_type" {
  type        = string
  description = "Instance type"
}

variable "asg_min_size" {
  type        = string
  description = "Min EC2 for ASG"
}

variable "asg_max_size" {
  type        = string
  description = "Max EC2 for ASG"
}

variable "desired_capacity" {
  type        = string
  description = "Desired capacity EC2 for ASG"
}