resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.app.id

  tags = {
    Name = "app-igw"
  }
}

resource "aws_nat_gateway" "NatGateway" {
  allocation_id = aws_eip.nat-ip.id
  subnet_id     = aws_subnet.pub1.id

  tags = {
    Name = "NAT Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "nat-ip" {
  domain       = "vpc"
}