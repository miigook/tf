resource "aws_lb" "app-lb" {
  name               = "app-lb-session5"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-sg.id]
  subnets            = [for subnet in data.terraform_remote_state.vpc.outputs.pub_subnets_ids : subnet]


  #   access_logs {
  #     bucket  = aws_s3_bucket.lb_logs.id
  #     prefix  = "app-lb"
  #     enabled = true
  #   }

  tags = {
    Environment = "production"
    Name        = var.lb_names
  }
}

output "dns-lb" {
  value = aws_lb.app-lb.dns_name
  
}