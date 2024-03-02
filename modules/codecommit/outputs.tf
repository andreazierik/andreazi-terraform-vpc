output "http" {
  value = aws_codecommit_repository.app-php.clone_url_http
}

output "ssh" {
  value = aws_codecommit_repository.app-php.clone_url_ssh
}