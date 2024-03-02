resource "aws_codecommit_repository" "app-php" {
  repository_name = var.repo-app-name
  description     = var.repo-default-desc
}