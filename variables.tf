variable "any-ip" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "IP corringa"
}

variable "aws_azs" {
  type        = list(string)
  default     = ["us-east-1e", "us-east-1f"]
  description = "Default AZs for this configuration"
}

variable "empresa" {
  type        = string
  default     = "iesde"
  description = "VPC name"
}

variable "container_port" {
  type        = string
  default     = "80"
  description = "Default container port"
}