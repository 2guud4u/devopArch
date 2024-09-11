terraform {
  backend "s3" {
    bucket = "terraformstatebucket120"
    key    = "terraform/statefile${var.uid}.tfstate"
    region = "us-west-2"
  }
}