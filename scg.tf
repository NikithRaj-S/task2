data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "az1" {
  filter {
    name   = "availability-zone"
    values = ["ap-south-1a"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "cidr-block"
    values = ["172.31.32.0/20"]
  }
}

data "aws_subnet" "az2" {
  filter {
    name   = "availability-zone"
    values = ["ap-south-1b"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "cidr-block"
    values = ["172.31.0.0/20"]
  }
}
data "aws_subnet" "az3" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "availability-zone"
    values = ["ap-south-1c"]
  }

  filter {
    name   = "cidr-block"
    values = ["172.31.16.0/20"]
  }
}


resource "aws_security_group" "sgu1" {
  name   = "sgu1"
  vpc_id = data.aws_vpc.default.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sgu1"
  }
}