resource "aws_vpc" "app" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC session 3"
  }
}


resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.app.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public-subnet1"
  }
}
resource "aws_subnet" "pub2" {
  vpc_id     = aws_vpc.app.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public-subnet2"
  }
}


resource "aws_subnet" "pub3" {
  vpc_id     = aws_vpc.app.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Public-subnet3"
  }
}

resource "aws_subnet" "priv1" {
  vpc_id     = aws_vpc.app.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private-subnet1"
  }
}

resource "aws_subnet" "priv2" {
  vpc_id     = aws_vpc.app.id
  cidr_block = "10.0.22.0/24"
  availability_zone = "us-east-1b"
 
  tags = {
    Name = "Private-subnet2"
  }
}
resource "aws_subnet" "priv3" {
  vpc_id     = aws_vpc.app.id
  cidr_block = "10.0.33.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Private-subnet3"
  }
}