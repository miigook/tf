output "pub_subnets_ids" {
  value = aws_subnet.pub[*].id
}

output "out_vpc_id" {
  value = aws_vpc.app.id
}
