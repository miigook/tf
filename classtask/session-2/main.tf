

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-01816d07b1128cd2d" # Amazon Linux 2 AMI in us-east-1. Check for latest in your region.
  instance_type = "t2.micro"

  tags = {
    Name = "web-server"
  }
}
#comment
output "public_ip" {
  value = aws_instance.web.public_ip
}
/* 
1. Resource - Block
2. "aws_instance" - first label, resource type defined by AWS 
3. web - second label, logical name/ID, resource name defined by user, must be unique
4. what's inside curly brackets are properties or arguments
5. argument value = string, boolean, number etc. a
*/