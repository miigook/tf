resource "aws_route_table" "app-rt-priv" {
  vpc_id = aws_vpc.app.id
  
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NatGateway.id
  }
  tags = {
    Name = "Route Table Private"
  }
}

resource "aws_route_table" "app-rt-pub" {
  vpc_id = aws_vpc.app.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Route Table Public"
  }
}
############### Public Route Table Assosiation ##########
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.pub1.id
  route_table_id = aws_route_table.app-rt-pub.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.pub2.id
  route_table_id = aws_route_table.app-rt-pub.id
}

resource "aws_route_table_association" "public3" {
  subnet_id      = aws_subnet.pub3.id
  route_table_id = aws_route_table.app-rt-pub.id
}
############### Private Route Table Assosiation ##########
resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.priv1.id
  route_table_id = aws_route_table.app-rt-priv.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.priv2.id
  route_table_id = aws_route_table.app-rt-priv.id
}
resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.priv3.id
  route_table_id = aws_route_table.app-rt-priv.id
}