output "sg-id" {
  value = aws_security_group.alb_sg.id
}

output "tg-arn" {
  value = aws_lb_target_group.asg-aplicacao.arn
}

output "alb-endpoint" {
  value = aws_lb.alb-asg-ec2.dns_name
}