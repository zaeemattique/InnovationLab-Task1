#!/bin/bash

# Update the system repositories to get the latest package information
sudo yum update -y

# Install Apache web server and enable auto-start on boot
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# Install PHP and necessary extensions
sudo amazon-linux-extras enable php8.2
sudo yum clean metadata
sudo yum install -y php php-mysqlnd php-fpm php-json php-mbstring

# Install MariaDB server to run MySQL database
sudo yum install -y mariadb105-server
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure MariaDB installation and set up WordPress database and user
sudo mysqladmin -u root password 'StrongPassword'

# Create WordPress database and user
sudo mysql -u root -p'StrongPassword' <<EOF
CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'wp-password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
EOF

# Download and configure WordPress
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo cp -r wordpress/* /var/www/html/
sudo rm -rf wordpress latest.tar.gz
sudo chown -R apache:apache /var/www/html/
sudo chmod -R 755 /var/www/html/

# Configure WordPress to connect to the database
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sudo sed -i 's/database_name_here/wordpress/' /var/www/html/wp-config.php
sudo sed -i 's/username_here/wpuser/' /var/www/html/wp-config.php
sudo sed -i 's/password_here/wp-password/' /var/www/html/wp-config.php

# Restart Apache to apply all changes
sudo systemctl restart httpd
