terraform {
  backend "s3" {
    bucket = "terraform-statefile-remote"
    key    = "classtask/session-7/stage/terraform.tfstate"
    region = "us-east-1"
  }
}