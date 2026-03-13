output "vpc_id" {
  value = aws_vpc.vpc-terraform-module.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet_1.id
}