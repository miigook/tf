module "main" {
 # arguments 
  source = "../../modules/webserver/ver1"
  instance_type = "t3.micro"
  env = "prod"
}
#   version = "5.75.0"
#  # variables
#   env = "dev"
#   instance_type = "t2.micro"
