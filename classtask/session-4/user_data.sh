#!/bin/bash
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
host_name=$HOSTNAME
sudo echo "<h1>Local-$host_name </h1>" > /var/www/html/index.html
