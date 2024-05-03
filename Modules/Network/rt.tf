# Public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.public_rt_cidr
    gateway_id = aws_internet_gateway.vpc_gw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

resource "aws_route_table" "private_rt_1" {
  vpc_id = aws_vpc.my_vpc.id

  # Route for NAT 2 
  route {
    cidr_block     = var.private_rt_cidr
    nat_gateway_id = aws_nat_gateway.NAT_Gateway_1.id
  }

  tags = {
    Name = var.private_rt_1_name
  }
}

resource "aws_route_table" "private_rt_2" {
  vpc_id = aws_vpc.my_vpc.id

  # Route for NAT 2
  route {
    cidr_block     = var.private_rt_cidr
    nat_gateway_id = aws_nat_gateway.NAT_Gateway_2.id
  }

  tags = {
    Name = var.private_rt_2_name
  }
}



# Attach public route table to public subnets
resource "aws_route_table_association" "attach_public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "attach_public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

# Attach private route table to private subnets

resource "aws_route_table_association" "attach_private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt_1.id
}

resource "aws_route_table_association" "attach_private_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt_2.id
}


