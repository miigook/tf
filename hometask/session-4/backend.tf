terraform {
  backend "s3" {
    bucket = "terraform-statefile-remote"
    key    = "hometask/session-4/terraform.tfstate"
    region = "us-east-1"
  }
}