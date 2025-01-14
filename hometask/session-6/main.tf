module "vpc" {
  source = "../../tf.modules/vpc"
  vpc-lb = module.alb_asg.alb-dns
  
}

module "alb_asg" {
  source = "../../tf.modules/alb_asg"
  app-vpc = module.vpc.vpc_id
  app-subnets-pub = module.vpc.pub_subnets_ids
  app-subnets-priv = module.vpc.priv_subnets_ids
  
}


output "dns_name" {
  value = module.alb_asg.alb-dns
  
}