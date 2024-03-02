output "repo-info" {
  value = {
    http = module.codecommit.http
    ssh  = module.codecommit.ssh
  }
}