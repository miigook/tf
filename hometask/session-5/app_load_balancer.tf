resource "aws_lb" "app-lb" {
  name               = "app-lb-session5"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-sg.id]
  subnets            = [for subnet in aws_subnet.pub : subnet.id]


#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "app-lb"
#     enabled = true
#   }

  tags = {
    Environment = "production"
    Name = var.lb_names
  }
}