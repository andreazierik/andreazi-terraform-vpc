output "vpc-id" {
  value = aws_vpc.andreazi_vpc.id
}

output "public_subnet" {
  value = aws_subnet.andreazi_public_subnet[*].id
}

output "private_subnet" {
  value = aws_subnet.andreazi_private_subnet[*].id
}