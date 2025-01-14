terraform {
  backend "s3" {
    bucket = "terraform-statefile-remote"
    key    = "classtask/session-9/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt = true
  }
}


