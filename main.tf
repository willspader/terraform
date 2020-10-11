provider "aws" {
    region     = "us-east-1"
}

resource "aws_instance" "dev" {
    count                  = 3
    ami                    = "ami-0817d428a6fb68645"
    instance_type          = "t2.micro"
    key_name               = "terraform-aws"
    vpc_security_group_ids = ["sg-01bea69eebfc95c36"]
    tags          = {
        Name = "dev${count.index}"
    }
}

resource "aws_security_group" "acesso_ssh" {
  name        = "acesso_ssh"
  description = "acesso_ssh"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["189.6.253.105/32"]
  }

  tags = {
    Name = "ssh"
  }
}
