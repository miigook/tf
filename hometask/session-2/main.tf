resource "aws_instance" "hometask2" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.allow_web.id ]
  key_name = "amin@macbook"
  user_data = <<-EOF
                #!/bin/bash
                sudo dnf install httpd -y
                sudo systemctl enable httpd
                sudo systemctl start httpd
                host_name=$HOSTNAME
                sudo echo "<h1>Local-$host_name </h1>" > /var/www/html/index.html
                EOF

  tags = {
    Name = "Session-2"
    Env = "testing"
    Hometask = session-2 
  }
}