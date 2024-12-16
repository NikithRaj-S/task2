resource "aws_lb" "lb1" {
  name               = "lb1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sgu1.id]
  subnets = [
    data.aws_subnet.az1.id,
    data.aws_subnet.az2.id,
    data.aws_subnet.az3.id
  ]
  tags = {
    Name = "lb1"
  }
}


resource "aws_lb_listener" "httplistener" {
  load_balancer_arn = aws_lb.lb1.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}

