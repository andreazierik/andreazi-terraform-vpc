resource "aws_ecr_repository" "bu-container-registre" {
  name = var.ecr_repo_name
}