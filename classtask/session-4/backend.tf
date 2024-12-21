terraform {
  backend "s3" {
    bucket = "terraform-statefile-remote"
    key    = "classtask/session-4/terraform.tfstate"
    region = "us-east-1"
  }
}