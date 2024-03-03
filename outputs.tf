output "repo-info" {
  value = {
    http = module.codecommit.http
    ssh  = module.codecommit.ssh
  }
}

output "alb-endpoint" {
  value = module.alb.alb-endpoint
}