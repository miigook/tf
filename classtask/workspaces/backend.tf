terraform {
  backend "s3" {
    bucket = "terraform-statefile-remote"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}