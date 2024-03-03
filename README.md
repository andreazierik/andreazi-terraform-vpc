# Criação de um cluster ECS e todos os serviços necessários para subir a aplicação

Falta finalizar os apontamentos das variáveis e executar a exportação para utilizar nos outros módulos

## Criação do Bucket para armazenar arquivos tfstate
aws s3api create-bucket --bucket andreazierik-terraform-state
aws s3api put-bucket-versioning --bucket andreazierik-terraform-state --versioning-configuration Status=Enabled

## Criando tabela no DynamoDB para armazenar o arquivo lock
aws dynamodb create-table \
--table-name andreazierik-terraform-state-lock-table \
--attribute-definitions AttributeName=LockID,AttributeType=S \
--key-schema AttributeName=LockID,KeyType=HASH \
--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ./modules/alb | n/a |
| <a name="module_asg"></a> [asg](#module\_asg) | ./modules/asg | n/a |
| <a name="module_codecommit"></a> [codecommit](#module\_codecommit) | ./modules/codecommit | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [http_http.casa-public-ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb-name"></a> [alb-name](#input\_alb-name) | Nome do ALB | `string` | n/a | yes |
| <a name="input_alb-sg-name"></a> [alb-sg-name](#input\_alb-sg-name) | Nome do Security Group pro Load Balance | `string` | n/a | yes |
| <a name="input_ami-id"></a> [ami-id](#input\_ami-id) | Default AMI com nginx e php 8.2 | `string` | n/a | yes |
| <a name="input_any-ip"></a> [any-ip](#input\_any-ip) | IP corringa | `string` | n/a | yes |
| <a name="input_asg-name"></a> [asg-name](#input\_asg-name) | Nome pro ASG | `string` | n/a | yes |
| <a name="input_asg-policy"></a> [asg-policy](#input\_asg-policy) | Nome da politica do ASG | `string` | n/a | yes |
| <a name="input_asg-policy-down"></a> [asg-policy-down](#input\_asg-policy-down) | Nome da policita para Scalling Down | `string` | n/a | yes |
| <a name="input_azs"></a> [azs](#input\_azs) | Default AZs for this configuration | `list(string)` | n/a | yes |
| <a name="input_cw-name"></a> [cw-name](#input\_cw-name) | Nome da metrica para scalling up | `string` | n/a | yes |
| <a name="input_cw-scaling-down"></a> [cw-scaling-down](#input\_cw-scaling-down) | Nome da metrica para scalling down | `string` | n/a | yes |
| <a name="input_ec2-sg-name"></a> [ec2-sg-name](#input\_ec2-sg-name) | Nome do SG para as instancias | `string` | n/a | yes |
| <a name="input_lt-name"></a> [lt-name](#input\_lt-name) | Nome do Launch Template | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | VPC name | `string` | n/a | yes |
| <a name="input_private_subnet_cidr_blocks"></a> [private\_subnet\_cidr\_blocks](#input\_private\_subnet\_cidr\_blocks) | Default CIDR for private subnets | `list(string)` | n/a | yes |
| <a name="input_public_subnet_cidr_blocks"></a> [public\_subnet\_cidr\_blocks](#input\_public\_subnet\_cidr\_blocks) | Default CIDR for public subnets | `list(string)` | n/a | yes |
| <a name="input_repo-app-name"></a> [repo-app-name](#input\_repo-app-name) | Reponame pro repositorio da Aplicacao | `string` | n/a | yes |
| <a name="input_repo-default-desc"></a> [repo-default-desc](#input\_repo-default-desc) | Descricao padro pros repositorios | `string` | n/a | yes |
| <a name="input_sshkey"></a> [sshkey](#input\_sshkey) | Default ssh key | `string` | n/a | yes |
| <a name="input_tg-name"></a> [tg-name](#input\_tg-name) | Nome padrao do Target Group | `string` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | Default CIDR for AWS VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb-endpoint"></a> [alb-endpoint](#output\_alb-endpoint) | n/a |
| <a name="output_repo-info"></a> [repo-info](#output\_repo-info) | n/a |
<!-- END_TF_DOCS -->