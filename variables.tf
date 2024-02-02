variable "any-ip" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "IP corringa"
}

variable "container_port" {
  type        = string
  default     = "80"
  description = "Default container port"
}