data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-statefile-remote"
    key = "hometask/session-4/terraform.tfstate" // Path to state file within this bucket
    region = "us-east-1" // Change this to the appropriate region
  }
}