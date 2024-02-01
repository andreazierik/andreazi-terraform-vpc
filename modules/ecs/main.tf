resource "aws_ecs_cluster" "bu-cluster" {
  name = var.demo_app_cluster_name
}

#### FALTA A SUBNET, VER A MELHOR FORMA DE UTILIZAR

resource "aws_ecs_task_definition" "bu-app-task" {
  family                   = var.demo_app_task_family
  container_definitions    = <<DEFINITION
  [
    {
        "name": "${var.demo_app_task_name}",
        "image": "${var.ecr_repo_url}",
        "essential": true,
        "portMappings": [
            {
                "containerPort": ${var.container_port},
                "hostPort": ${var.container_port}
            }
        ],
        "memory": 512,
        "cpu": 256
    }
  ]
  DEFINITION
  requires_compatibilities = ["FATGATE"]
  network_mode             = "awsvpc"
  memory                   = 512
  cpu                      = 256
  execution_role_arn       = aws_iam_role.ecs_task_execution_arn
}

resource "aws_ecs_service" "bu-app-service" {
  name            = var.demo_app_service_name
  cluster         = aws_ecs_cluster.bu-cluster.id
  task_definition = aws_ecs_task_definition.bu-app-task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  load_balancer {
    target_group_arn = var.tg-arn
    container_name   = aws_ecs_task_definition.bu-app-task.family
    container_port   = var.container_port
  }

  network_configuration {
    subnets          = []
    assign_public_ip = true
    security_groups  = var.tg-id
  }
}

resource "aws_security_group" "service_security_group" {
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = var.alb-id
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}