output "vpc-id" {
  value = aws_vpc.iesde_vpc.id
}

output "public_subnet" {
  value = aws_subnet.iesde_public_subnets[*].id
}

output "private_subnet" {
  value = aws_subnet.iesde_private_subnets[*].id
}