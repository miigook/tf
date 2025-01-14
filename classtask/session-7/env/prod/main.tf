module "vpc" {
 # arguments 
  source = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}
#   version = "5.75.0"
#  # variables
#   env = "dev"
#   instance_type = "t2.micro"


module "main" {
 # arguments 
  source = "../../modules/webserver/ver1"
  instance_type = "t2.micro"
  env = "prod"
  my_subnet_id = module.vpc.pub_subnets_ids[0]
  my_vpc_id = module.vpc.out_vpc_id
}

# variable "my_vpc_id" {
#     type = string
  
# }