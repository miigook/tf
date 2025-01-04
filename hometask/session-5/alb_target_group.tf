resource "aws_lb_target_group" "app-tg" {
  name     = "target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app.id
}


resource "aws_lb_listener" "app-lb-listener" {
  load_balancer_arn = aws_lb.app-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app-tg.arn
  }
}

