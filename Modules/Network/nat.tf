resource "aws_eip" "nat_ip_1" {
  domain = "vpc"
  tags = {
    Name = var.eip_name_1
  }
}

resource "aws_eip" "nat_ip_2" {
  domain = "vpc"
  tags = {
    Name = var.eip_name_2
  }
}



resource "aws_nat_gateway" "NAT_Gateway_1" {
  allocation_id = aws_eip.nat_ip_1.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = var.nat_gateway_name
  }

}


resource "aws_nat_gateway" "NAT_Gateway_2" {
  allocation_id = aws_eip.nat_ip_2.id
  subnet_id     = aws_subnet.public_subnet_2.id

  tags = {
    Name = var.nat_gateway_name
  }

}


