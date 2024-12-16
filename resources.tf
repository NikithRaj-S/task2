resource "aws_instance" "example_1"  {
  ami = "ami-0327f51db613d7bd2"
  instance_type = "t2.micro"
  key_name = "Dramex"
  count = "1"
  security_groups = [aws_security_group.allow_all.name]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd
  EOF

  tags = {
    Name ="claw"
  }
}

resource "aws_security_group" "allow_all" {
    name = "allow-all-traffic-nikith"
    description = "Allow all inbound and outbound"
    

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSh traffic"
    }
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSh traffic"
    }

    tags = {
        name="allow-all-traffic-nikith"
    }

}