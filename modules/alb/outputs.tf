output "sg-id" {
  value = aws_security_group.alb_sg.id
}

output "alb-endpoint" {
  value = aws_lb.alb-asg-ec2.dns_name
}