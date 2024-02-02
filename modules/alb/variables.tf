variable "any-ip" {}

variable "application_load_balancer_name" {
  type        = string
  default     = "blogupper-ecs-alb"
  description = "ALB name"
}

variable "target_group_name" {
  type        = string
  default     = "blogupper-tg"
  description = "Target Group name"
}

variable "container_port" {}