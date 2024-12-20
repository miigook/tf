resource "aws_security_group" "tf-sg" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic and all outbound traffic"

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.tf-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

tags = {
Name = var.security_group_name
Env = var.env
  }
}

resource "aws_vpc_security_group_egress_rule" "all-outbound" {
  security_group_id = aws_security_group.tf-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}