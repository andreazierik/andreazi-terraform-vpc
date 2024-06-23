output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "tg_arn" {
  value = aws_lb_target_group.andreazi_ecs_tg.id
}