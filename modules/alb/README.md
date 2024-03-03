<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_lb.alb-asg-ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.alb-rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.asg-aplicacao](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.alb_http_ingress_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.alb_https_ingress_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb-name"></a> [alb-name](#input\_alb-name) | n/a | `any` | n/a | yes |
| <a name="input_alb-sg-name"></a> [alb-sg-name](#input\_alb-sg-name) | n/a | `any` | n/a | yes |
| <a name="input_any-ip"></a> [any-ip](#input\_any-ip) | n/a | `any` | n/a | yes |
| <a name="input_public_subnet_id"></a> [public\_subnet\_id](#input\_public\_subnet\_id) | n/a | `any` | n/a | yes |
| <a name="input_tg-name"></a> [tg-name](#input\_tg-name) | n/a | `any` | n/a | yes |
| <a name="input_vpc-id"></a> [vpc-id](#input\_vpc-id) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb-endpoint"></a> [alb-endpoint](#output\_alb-endpoint) | n/a |
| <a name="output_alb-zone-id"></a> [alb-zone-id](#output\_alb-zone-id) | n/a |
| <a name="output_sg-id"></a> [sg-id](#output\_sg-id) | n/a |
| <a name="output_tg-arn"></a> [tg-arn](#output\_tg-arn) | n/a |
<!-- END_TF_DOCS -->