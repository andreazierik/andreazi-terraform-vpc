variable "any-ip" {
  type        = string
  description = "IP corringa"
}

variable "name" {
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