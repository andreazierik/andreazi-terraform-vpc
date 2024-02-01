resource "aws_security_group" "load_balancer_security_group" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_alb_target_group" "target_group" {
  name     = var.target_group_name
  port     = var.container_port
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default_vpc.id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.applicatoin_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.target_group.arn
  }
}

resource "aws_alb" "applicatoin_load_balancer" {
  name               = var.application_load_balancer_name
  load_balancer_type = "application"
  subnets = [

  ]

  security_groups = ["${aws_security_group.load_balancer_security_group.id}"]
}