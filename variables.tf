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

variable "alb-sg-name" {
  type        = string
  description = "Nome do Security Group pro Load Balance"
}

variable "tg-name" {
  type        = string
  description = "Nome padrao do Target Group"
}

variable "alb-name" {
  type        = string
  description = "Nome do ALB"
}

variable "ec2-sg-name" {
  type        = string
  description = "Nome do SG para as instancias"
}

variable "lt-name" {
  type        = string
  description = "Nome do Launch Template"
}

variable "ami-id" {
  type        = string
  description = "Default AMI com nginx e php 8.2"
}

variable "sshkey" {
  type        = string
  description = "Default ssh key"
}

variable "asg-name" {
  type        = string
  description = "Nome pro ASG"
}

variable "asg-policy" {
  type        = string
  description = "Nome da politica do ASG"
}

variable "cw-name" {
  type        = string
  description = "Nome da metrica para scalling up"
}

variable "asg-policy-down" {
  type        = string
  description = "Nome da policita para Scalling Down"
}

variable "cw-scaling-down" {
  type        = string
  description = "Nome da metrica para scalling down"
}