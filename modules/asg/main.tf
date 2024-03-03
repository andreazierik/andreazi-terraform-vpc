resource "aws_security_group" "ec2_sg" {
  name   = var.ec2-sg-name
  vpc_id = var.vpc-id
}

resource "aws_security_group_rule" "ec2_http_ingress_traffic" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ec2_sg.id
  source_security_group_id = var.alb-sg-id
}

resource "aws_launch_template" "ami-base" {
  name                   = var.lt-name
  image_id               = var.ami-id
  key_name               = var.sshkey
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}

resource "aws_autoscaling_group" "asg-aplicacao" {
  name     = var.asg-name
  min_size = 1
  max_size = 3
  desired_capacity = 2

  health_check_type = "EC2"

  vpc_zone_identifier = var.public-subnet

  target_group_arns = var.tg-arn

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = var.lt-id
      }
    }
  }
}

resource "aws_autoscaling_policy" "asg-policy" {
  name                   = var.asg-policy
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.asg-aplicacao.name

  estimated_instance_warmup = 300

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 80
  }
}