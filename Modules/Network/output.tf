output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "private_subnets_id" {
  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}

output "all_subnets_id" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id, aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}
