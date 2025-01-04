variable "instance_type" {
    type  = string
    default = "t2.micro"
    description = "This is instance Type"

  
}

variable "instance_name" {
  type = string
  default = "My-EC2"
  description = "This is EC2"
}

variable "security_group_name" {
    type = string
    default = "MySG"
    description = "Security Group for tf"
}
variable "env" {
    type = list(string)
    default = ["dev"]
    description = "Development Env"

}
variable "ports" {
    type = list(number)
    default = [80, 22, 443]
    description = "Security Group for tf"
}

variable "cidrs" {
    type = list(string)
    default = ["73.74.183.123/32","0.0.0.0/0", "0.0.0.0/0"]
    description = "Security Group for tf"
}



variable "cloud" {
    default = "aws"
  
}

variable "region" {
    default = "us-east-1"
  
}

variable "team" {
    default = "DevOps"
 
}

variable "environment" {
    default = "Dev"
  
}
variable "project" {
    default = "skylight"
}

variable "app-tier" {
    default = "front-end"
  
}

variable "department" {
    default = "finance"
  
}

variable "managedby" {
    default = "terraform"
  
}

variable "owner" {
    default = "Me"
  
}

variable "rtype" {
    default = "ec2"
  
}
