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
| <a name="module_codecommit"></a> [codecommit](#module\_codecommit) | ./modules/codecommit | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [http_http.casa-public-ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_any-ip"></a> [any-ip](#input\_any-ip) | IP corringa | `string` | n/a | yes |
| <a name="input_azs"></a> [azs](#input\_azs) | Default AZs for this configuration | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | VPC name | `string` | n/a | yes |
| <a name="input_private_subnet_cidr_blocks"></a> [private\_subnet\_cidr\_blocks](#input\_private\_subnet\_cidr\_blocks) | Default CIDR for private subnets | `list(string)` | n/a | yes |
| <a name="input_public_subnet_cidr_blocks"></a> [public\_subnet\_cidr\_blocks](#input\_public\_subnet\_cidr\_blocks) | Default CIDR for public subnets | `list(string)` | n/a | yes |
| <a name="input_repo-app-name"></a> [repo-app-name](#input\_repo-app-name) | Reponame pro repositorio da Aplicacao | `string` | n/a | yes |
| <a name="input_repo-default-desc"></a> [repo-default-desc](#input\_repo-default-desc) | Descricao padro pros repositorios | `string` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | Default CIDR for AWS VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repo-info"></a> [repo-info](#output\_repo-info) | n/a |
<!-- END_TF_DOCS -->