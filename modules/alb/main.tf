resource "aws_security_group" "alb_sg" {
  name   = "${var.projeto}-alb-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "alb_http_ingress_traffic" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_sg.id
  cidr_blocks       = ["45.230.103.149/32"]

  depends_on = [aws_security_group.alb_sg]
}

resource "aws_security_group_rule" "alb_https_ingress_traffic" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_sg.id
  cidr_blocks       = ["45.230.103.149/32"]

  depends_on = [aws_security_group.alb_sg]
}

resource "aws_lb_target_group" "andreazi_ecs_tg" {
  name     = "${var.projeto}-ecs-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    port                = 80
    interval            = 30
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200-299"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb" "default_alb" {
  name               = "${var.projeto}-loadbalance"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnet_id

  depends_on = [aws_security_group.alb_sg, aws_lb_target_group.andreazi_ecs_tg]
}

resource "aws_lb_listener" "andreazi_ecs_listener" {
  load_balancer_arn = aws_lb.default_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.andreazi_ecs_tg.arn
  }
}