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

variable "repo-app-name" {
  type        = string
  description = "Reponame pro repositorio da Aplicacao"
}

variable "repo-default-desc" {
  type        = string
  description = "Descricao padro pros repositorios"
}