# cria a vpc para substituir a padrao
resource "aws_vpc" "andreazi_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-${var.projeto}"
  }
}

# cria duas subnets publicas, apontando para duas zonas de disponibilidades diferentes
resource "aws_subnet" "andreazi_public_subnet" {
  count                   = length(var.public_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.andreazi_vpc.id
  cidr_block              = element(var.public_subnet_cidr_blocks, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-${count.index + 1}"
  }

  depends_on = [aws_vpc.andreazi_vpc]
}

# cria duas subnets privadas, apontando para duas zonas de disponibilidades diferentes
resource "aws_subnet" "andreazi_private_subnet" {
  count             = length(var.private_subnet_cidr_blocks)
  vpc_id            = aws_vpc.andreazi_vpc.id
  cidr_block        = element(var.private_subnet_cidr_blocks, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private-Subnet-${count.index + 1}"
  }

  depends_on = [aws_vpc.andreazi_vpc]
}

# cria o internet gateway - atacha automaticamente com a VPC
resource "aws_internet_gateway" "andreazi_igw" {
  vpc_id = aws_vpc.andreazi_vpc.id

  tags = {
    Name = "igw-${var.projeto}"
  }
}

# cria route table - vou configurar como a publica
resource "aws_route_table" "andreazi_rt_public" {
  vpc_id = aws_vpc.andreazi_vpc.id

  route {
    cidr_block = var.any-ip
    gateway_id = aws_internet_gateway.andreazi_igw.id
  }

  tags = {
    Name = "Public-RT"
  }

  depends_on = [aws_vpc.andreazi_vpc, aws_subnet.andreazi_public_subnet]
}

# cria route table - vou configurar como a privada
resource "aws_route_table" "andreazi_rt_private" {
  vpc_id = aws_vpc.andreazi_vpc.id

  tags = {
    Name = "Private-RT"
  }

  depends_on = [aws_vpc.andreazi_vpc, aws_subnet.andreazi_private_subnet]
}

# associar as subnets publicas na route table criada
resource "aws_route_table_association" "andreazi_public_subnet_asso" {
  count          = length(var.public_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.andreazi_public_subnet[*].id, count.index)
  route_table_id = aws_route_table.andreazi_rt_public.id

  depends_on = [aws_vpc.andreazi_vpc, aws_subnet.andreazi_public_subnet, aws_route_table.andreazi_rt_public]
}

# associar as subnets privadas na route table criada
resource "aws_route_table_association" "andreazi_private_subnet_asso" {
  count          = length(var.private_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.andreazi_private_subnet[*].id, count.index)
  route_table_id = aws_route_table.andreazi_rt_private.id

  depends_on = [aws_vpc.andreazi_vpc, aws_subnet.andreazi_private_subnet, aws_route_table.andreazi_rt_private]
}

# criacao de vpc endpoint para conectar com o S3
resource "aws_vpc_endpoint" "s3_endpoint_gateway" {
  vpc_id            = aws_vpc.andreazi_vpc.id
  service_name      = var.gateway_vpc_name
  route_table_ids   = [aws_route_table.andreazi_rt_private.id]
  vpc_endpoint_type = "Gateway"

  tags = {
    Name = "s3-enpoint-private-subnet"
  }

  depends_on = [aws_vpc.andreazi_vpc, aws_subnet.andreazi_private_subnet, aws_route_table.andreazi_rt_private, aws_route_table_association.andreazi_private_subnet_asso]
}