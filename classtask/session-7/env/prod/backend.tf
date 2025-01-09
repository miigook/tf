terraform {
  backend "s3" {
    bucket = "terraform-statefile-remote"
    key    = "classtask/session-7/prod/terraform.tfstate"
    region = "us-east-1"
  }
}