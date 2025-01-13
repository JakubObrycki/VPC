#Vpc
resource "aws_vpc" "My_vpc" {
  cidr_block       = var.vpc_cidr #informacja na ten temat jest w zmiennej var.
  instance_tenancy = "default"
  
  tags = {
    Name = "Vpc"
  }
}

#Subnets
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.My_vpc.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "Public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.My_vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "Private_subnet"
  }
}

#Igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.My_vpc.id

  tags = {
    Name = "Internet_gateway"
  }
}

#Route table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.My_vpc.id

  route {
    cidr_block = var.route_table
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "My_route_table"
  }
}

#Route table association
resource "aws_route_table_association" "public_route_table_assn" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}