# data "aws_ami" "os_image" {
#     owners = ["863518438392"]
#     most_recent = true
#     filter {
#       name = "state"
#       values = ["available"]
#     }
#     # filter {
#     #   name = "name"
#     #   values =["ununtu/images/hvm-ssd/*"]
#     # }
# }

resource "aws_key_pair" "key-name" {
  key_name   = "id_rsa"
  public_key = file("/Users/lai/Desktop/Lai_LAB/mega-project/.ssh/id_rsa.pub")
}

resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "sg_name" {
  name        = "security_group_lai"
  description = "first security group"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "allow access to ssh port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # ingress {
  #   description = "allow access to http port 80"
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # ingress {
  #   description = "allow access to https port 443"
  #   from_port   = 443
  #   to_port     = 443
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  #}
  ingress {
    description = "Incoming traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "outgoing traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "security_group_lai"
  }

}

resource "aws_instance" "lai-instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.sg_name.name]
  key_name        = aws_key_pair.key-name.key_name
  tags = {
    name = "lai-instance"
  }
  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }
}
