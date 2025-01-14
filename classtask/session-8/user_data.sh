#!/bin/bash
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
sudo echo "<h1>Local- ($HOSTNAME -f) </h1>" > /var/www/html/index.html