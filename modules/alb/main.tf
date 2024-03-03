resource "aws_security_group" "alb_sg" {
  name   = var.alb-sg-name
  vpc_id = var.vpc-id
}

resource "aws_security_group_rule" "alb_http_ingress_traffic" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_sg.id
  cidr_blocks       = var.any-ip
}

resource "aws_security_group_rule" "alb_https_ingress_traffic" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_sg.id
  cidr_blocks       = var.any-ip
}

resource "aws_lb_target_group" "asg-aplicacao" {
  name     = var.tg-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id

  health_check {
    enabled             = true
    port                = 80
    interval            = 30
    protocol            = "HTTP"
    path                = "/index.php"
    matcher             = "200"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb" "alb-asg-ec2" {
  name               = var.alb-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]

  subnets = var.public_subnet_id
}

resource "aws_lb_listener" "alb-rule" {
  load_balancer_arn = aws_lb.alb-asg-ec2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg-aplicacao.arn
  }
}