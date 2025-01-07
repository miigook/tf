


resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id # Amazon Linux  AMI in us-east-1. Check for latest in your region.
  instance_type          = var.env == "prod" ? "t2.medium": "t2.micro"
  vpc_security_group_ids = [aws_security_group.tf-sg.id]
  count = 3
  lifecycle {
    create_before_destroy = true
  }
  tags = merge(
    {Name = format(local.Name, "ec2-${count.index}")},
  local.common_tags
  ) 
}





/* 
1. Resource Attribute Reference
    PROVIDER_TYPE.LOGICALID.Attribute
2. Variable Reference
    var.variable_name {
    }
Variables 
    1. default value is required
    2. Can be specified in command line : terraform apply -var=instance_type=t2.micro
    3. Env Variable can be declared : TF_VAR_variable_name

3. Data source Reference
    data.first_label.second_label.attribute
    Date Types:
    [] - list
    {} - map
    "" - string
*/