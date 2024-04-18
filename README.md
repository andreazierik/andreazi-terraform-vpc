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


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_any-ip"></a> [any-ip](#input\_any-ip) | IP corringa | `string` | n/a | yes |
| <a name="input_azs"></a> [azs](#input\_azs) | Default AZs for this configuration | `list(string)` | n/a | yes |
| <a name="input_private_subnet_cidr_blocks"></a> [private\_subnet\_cidr\_blocks](#input\_private\_subnet\_cidr\_blocks) | Default CIDR for private subnets | `list(string)` | n/a | yes |
| <a name="input_projeto"></a> [projeto](#input\_projeto) | VPC name | `string` | n/a | yes |
| <a name="input_public_subnet_cidr_blocks"></a> [public\_subnet\_cidr\_blocks](#input\_public\_subnet\_cidr\_blocks) | Default CIDR for public subnets | `list(string)` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | Default CIDR for AWS VPC | `string` | n/a | yes |
<!-- END_TF_DOCS -->