resource "aws_security_group" "tf-sg" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic and all outbound traffic"

  tags = merge(
  {Name = format(local.Name, "SG")},
  local.common_tags

  )
}


resource "aws_vpc_security_group_egress_rule" "all-outbound" {
  security_group_id = aws_security_group.tf-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



resource "aws_vpc_security_group_ingress_rule" "allow_ingress" {
  security_group_id = aws_security_group.tf-sg.id
  for_each = var.ports_sg
  cidr_ipv4         = each.value.cidr_ipv4
  from_port         = each.value.from_port
  ip_protocol       = each.value.ip_protocol
  to_port           = each.value.to_port

tags = {
  Name = each.key
}
}