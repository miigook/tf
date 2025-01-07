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
# variable "ports" {
#     type = list(number)
#     default = [80, 22, 443]
#     description = "Security Group for tf"
# }

# variable "cidrs" {
#     type = list(string)
#     default = ["73.74.183.123/32","0.0.0.0/0", "0.0.0.0/0"]
#     description = "Security Group for tf"
# }



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



############### User List ####################

variable "user_list" {
    type = set(string)
    default = ["Alex", "Anna", "Alice", "Anastasia"]
    description = "Stuff"
}

variable "user_map" {
    type = map(string)
    default = {
      "User1" = "Bobur"
      "User2" = "Dovud"
      "User3" = "Celena"
    }
  
}


############### SG ###########

variable "ports_sg" {
  type = map(object({
      from_port = number
      to_port = number
      ip_protocol = string
      cidr_ipv4 = string
  }))
  default = {
    ssh = {
      from_port = 22
      to_port = 22
      ip_protocol =  "tcp"
      cidr_ipv4 = "73.74.183.123/32"
    }
    http = {
      from_port = 80
      to_port = 80
      ip_protocol = "tcp"
      cidr_ipv4 =  "0.0.0.0/0"
    }
    https = {
      from_port = 443
      to_port = 443
      ip_protocol = "tcp"
      cidr_ipv4 = "0.0.0.0/0"
    }
  }
}