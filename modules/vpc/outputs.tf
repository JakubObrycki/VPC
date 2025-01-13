output "vpc_id" {
    value = aws_vpc.My_vpc.id
}

output "subnet_id" {
    value = aws_subnet.public_subnet.id
}