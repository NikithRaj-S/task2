resource "aws_launch_template" "lt1" {
  image_id               = "ami-0327f51db613d7bd2"
  instance_type          = "t2.micro"
  key_name               = "Dramex"
  vpc_security_group_ids = [aws_security_group.sgu1.id]
  
  user_data = base64encode(<<-EOF
  #!/bin/bash
  yum update -y
  yum install httpd -y
  systemctl start httpd
  systemctl enable httpd
  EOF
  )
  tags = {
    Name = "lt1"
  }

}