terraform {
  backend "s3" {
    bucket = "terraformstatebucket120"
    key    = "terraform/statefile.tfstate"
    region = "us-west-2"
  }
}