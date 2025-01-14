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
    type = string
    default = "Enviroment"
    description = "Development Env"

}