# security group pro lauch template
resource "aws_security_group" "lt_security_group" {
  name   = "${var.projeto}-ecs-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "lt_security_group_ingress_http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.lt_security_group.id
  source_security_group_id = var.alb_sg_id
}

resource "aws_security_group_rule" "lt_security_group_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.lt_security_group.id
  cidr_blocks       = [ var.any_ip ]
}

# criando launch template para servir de base pro cluster ECS
resource "aws_launch_template" "andreazi_ecs_cluster" {
  name                   = "${var.projeto}-ecs-cluster"
  image_id               = var.ecs_ami
  key_name               = "estudos"
  instance_type          = var.lt_instance_type
  vpc_security_group_ids = [aws_security_group.lt_security_group.id]
  iam_instance_profile {
    name = "ecsInstanceRole"
  }

  depends_on = [aws_security_group.lt_security_group]
}

# criando o asg
resource "aws_autoscaling_group" "andreazi_ecs_asg" {
  name                      = "${var.projeto}-ecs-alb"
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = 240
  health_check_type         = "ELB"
  vpc_zone_identifier       = var.private_subnets
  target_group_arns         = [var.tg_arn]

  launch_template {
    id      = aws_launch_template.andreazi_ecs_cluster.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.projeto}-ecs-server"
    propagate_at_launch = true
  }
}