resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id 
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.tf-sg.id]
  key_name = "amin@macbook"

    tags = {
    Name = var.instance_name
    Env = var.env
  }
}
  # user_data = file("./user_data.sh")

  # provisioner "local-exec" {
  #   command = "echo ${self.private_ip} >> output.txt"
  # }

resource "null_resource" "cluster" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    instance_id = aws_instance.web.id
    timestamp = "${timestamp()}"
  }
connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host     = aws_instance.web.public_ip
}
  provisioner "file" {
    source      = "./index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt install apache2-bin -y",
      "sudo apt install mime-support -y",
      "sudo apt install apache2 -y",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2",
      "sudo cp /tmp/index.html /var/www/html/"
    
    ]
  }
}







