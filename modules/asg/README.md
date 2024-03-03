<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.asg-aplicacao](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.asg-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.scale_down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_cloudwatch_metric_alarm.scale_down_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.scale_up_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_launch_template.ami-base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.ec2_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.ec2_http_ingress_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb-sg-id"></a> [alb-sg-id](#input\_alb-sg-id) | n/a | `any` | n/a | yes |
| <a name="input_ami-id"></a> [ami-id](#input\_ami-id) | n/a | `any` | n/a | yes |
| <a name="input_asg-name"></a> [asg-name](#input\_asg-name) | n/a | `any` | n/a | yes |
| <a name="input_asg-policy"></a> [asg-policy](#input\_asg-policy) | n/a | `any` | n/a | yes |
| <a name="input_asg-policy-down"></a> [asg-policy-down](#input\_asg-policy-down) | n/a | `any` | n/a | yes |
| <a name="input_cw-name"></a> [cw-name](#input\_cw-name) | n/a | `any` | n/a | yes |
| <a name="input_cw-scaling-down"></a> [cw-scaling-down](#input\_cw-scaling-down) | n/a | `any` | n/a | yes |
| <a name="input_ec2-sg-name"></a> [ec2-sg-name](#input\_ec2-sg-name) | n/a | `any` | n/a | yes |
| <a name="input_lt-name"></a> [lt-name](#input\_lt-name) | n/a | `any` | n/a | yes |
| <a name="input_public-subnets"></a> [public-subnets](#input\_public-subnets) | n/a | `any` | n/a | yes |
| <a name="input_sshkey"></a> [sshkey](#input\_sshkey) | n/a | `any` | n/a | yes |
| <a name="input_tg-arn"></a> [tg-arn](#input\_tg-arn) | n/a | `any` | n/a | yes |
| <a name="input_vpc-id"></a> [vpc-id](#input\_vpc-id) | n/a | `any` | n/a | yes |
<!-- END_TF_DOCS -->