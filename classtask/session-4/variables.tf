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
    default = ["Enviroment", "dev", "prod", "qa"]
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