# criacao do cluster ECS
resource "aws_ecs_cluster" "andreazi_ecs_cluster" {
  name = "${var.projeto}-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_capacity_provider" "andreazi_ecs_capacity_provider" {
  name = "${var.projeto}-ecs-capacity-provider"

  auto_scaling_group_provider {
    auto_scaling_group_arn = var.asg_arn
    managed_scaling {
      maximum_scaling_step_size = 1000
      minimum_scaling_step_size = 1
      status = "ENABLED"
      target_capacity = 100
    }
  }
}

https://spacelift.io/blog/terraform-ecs
https://medium.com/@ramonriserio/como-implantar-uma-aplica%C3%A7%C3%A3o-usando-aws-ecs-e-terraform-tutorial-b40417fb106a