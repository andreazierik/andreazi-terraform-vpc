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