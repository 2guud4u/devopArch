terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "region" { type= string }
variable "instance_type" { type= string }
variable "uid" { type= string }

provider "aws" {
  region  = var.region
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  owners = ["amazon"]  # Public AMIs owned by Amazon

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Pattern for Amazon Linux 2
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type

  tags = {
    "uid" = var.uid
  }
}

