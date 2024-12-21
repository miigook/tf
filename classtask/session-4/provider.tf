provider "aws" {
  region = "us-east-1"
}

provider "aws"  {
  region = "us-east-2"
  profile = "default"
  alias = "ohio"
}