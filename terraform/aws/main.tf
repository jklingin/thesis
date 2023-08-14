terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_security_group" "main" {
  name        = "main-sg"
  description = "SSH security group"
  vpc_id      = var.vpc_id

  # Incoming traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  # Outgoing traffic
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create virtual machine
resource "aws_instance" "main" {
  ami               = var.image_id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  key_name          = var.key_name
  security_groups   = [ aws_security_group.main.id ]
  subnet_id         = var.subnet_id
  user_data         = "${file("../cloud-user-data.txt")}"

  ebs_block_device {
      device_name = "/dev/sda1"
      volume_size = 300
      volume_type = "gp2"
      delete_on_termination = true
      encrypted = true
  }
}

