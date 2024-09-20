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

resource "aws_instance" "app_server" {
  ami           = "ami-05134c8ef96964280"
  instance_type = var.instance_type

  tags = {
    "uid" = var.uid
  }
}

