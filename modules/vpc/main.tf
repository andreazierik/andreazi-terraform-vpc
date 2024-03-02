# cria a vpc para substituir a padrao
resource "aws_vpc" "iesde_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-${var.name}"
  }
}

# cria duas subnets publicas, apontando para duas zonas de disponibilidades diferentes
resource "aws_subnet" "iesde_public_subnets" {
  count                   = length(var.public_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.iesde_vpc.id
  cidr_block              = element(var.public_subnet_cidr_blocks, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-${count.index + 1}"
  }
}

# cria duas subnets privadas, apontando para duas zonas de disponibilidades diferentes
resource "aws_subnet" "iesde_private_subnets" {
  count             = length(var.private_subnet_cidr_blocks)
  vpc_id            = aws_vpc.iesde_vpc.id
  cidr_block        = element(var.private_subnet_cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private-Subnet-${count.index + 1}"
  }
}

# cria o internet gateway - atacha automaticamente com a VPC
resource "aws_internet_gateway" "iesde_igw" {
  vpc_id = aws_vpc.iesde_vpc.id

  tags = {
    Name = "igw-${var.name}"
  }
}

# cria route table - vou configurar como a publica
resource "aws_route_table" "iesde_rt_public" {
  vpc_id = aws_vpc.iesde_vpc.id

  route {
    cidr_block = var.any-ip
    gateway_id = aws_internet_gateway.iesde_igw.id
  }

  tags = {
    Name = "Public-RT"
  }
}

# associar as subnets publicas na route table criada
resource "aws_route_table_association" "iesde_public_subnet_asso" {
  count          = length(var.public_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.iesde_public_subnets[*].id, count.index)
  route_table_id = aws_route_table.iesde_rt_public.id
}