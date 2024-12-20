resource "aws_security_group" "allow_web" {
  name        = "allow_web_server"
  description = "Allow ssh and http inbound traffic and all outbound traffic"
  

  tags = {
    Name = "allow_ssh and http"
    Env = "Testing"
    Hometask = "session2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ip4_web" {
  security_group_id = aws_security_group.allow_web.id
  
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
  tags = {
    Name = "http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ip4_ssh" {
  security_group_id = aws_security_group.allow_web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "ssh allowed"
  }
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

  tags = {
    Name = "all ports open"
  }
}
