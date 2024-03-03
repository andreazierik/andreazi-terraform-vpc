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
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}

resource "aws_autoscaling_group" "asg-aplicacao" {
  name                      = var.asg-name
  min_size                  = 0
  max_size                  = 0
  desired_capacity          = 0
  health_check_grace_period = 300
  health_check_type         = "ELB"
  vpc_zone_identifier       = var.public-subnets
  target_group_arns         = [var.tg-arn]

  launch_template {
    id      = aws_launch_template.ami-base.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "asg-policy" {
  name                   = var.asg-policy
  autoscaling_group_name = aws_autoscaling_group.asg-aplicacao.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name          = var.cw-name
  alarm_description   = "asg-scale-up_cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  dimensions = {
    "AutoScallingGroupName" = aws_autoscaling_group.asg-aplicacao.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.asg-policy.arn]
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = var.asg-policy-down
  autoscaling_group_name = aws_autoscaling_group.asg-aplicacao.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name          = var.cw-scaling-down
  alarm_description   = "asg-scale-down_cpu-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"
  dimensions = {
    "AutoScallingGroupName" = aws_autoscaling_group.asg-aplicacao.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scale_down.arn]
}