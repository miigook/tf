terraform {
  backend "s3" {
    bucket = "terraform-statefile-remote"
    key    = "classtask/session-8/terraform.tfstate"
    region = "us-east-1"
  }
}