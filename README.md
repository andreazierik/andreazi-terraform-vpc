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