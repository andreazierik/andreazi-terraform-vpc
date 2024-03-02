<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.alb_http_ingress_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.alb_https_ingress_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb-sg-name"></a> [alb-sg-name](#input\_alb-sg-name) | n/a | `any` | n/a | yes |
| <a name="input_any-ip"></a> [any-ip](#input\_any-ip) | n/a | `any` | n/a | yes |
| <a name="input_vpc-id"></a> [vpc-id](#input\_vpc-id) | n/a | `any` | n/a | yes |
<!-- END_TF_DOCS -->