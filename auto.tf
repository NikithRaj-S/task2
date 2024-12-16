resource "aws_autoscaling_group" "ag1" {
  name             = "ag1"
  min_size         = 2
  max_size         = 2
  desired_capacity = 2
  vpc_zone_identifier = [
    data.aws_subnet.az1.id,
    data.aws_subnet.az2.id
  ]
  launch_template {
    id      = aws_launch_template.lt1.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "ag1"
    propagate_at_launch = true
  }

}