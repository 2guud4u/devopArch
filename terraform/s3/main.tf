terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "bucketName" { type= string } 
variable "region" { type= string }
variable "uid" { type= string }

provider "aws" {
  region  = var.region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucketName  # Change this to your desired bucket name
  tags = {
    "uid" = var.uid
  }
}