#!/bin/bash

# Update and install necessary packages
sudo yum update -y
sudo yum install -y httpd mariadb-server php php-mysqlnd wget unzip

## Install Apache if not already installed
sudo yum install -y httpd

# Enable and start Apache service
sudo systemctl enable httpd
sudo systemctl start httpd

# Start and enable services
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure MariaDB
mysql_secure_installation <<EOF

y
password123
password123
y
y
y
y
EOF

# Create a database and user for WordPress
DB_NAME="wordpress_db"
DB_USER="wordpress_user"
DB_PASSWORD="password123"

mysql -u root -ppassword123 <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

# Download and configure WordPress
cd /var/www/html
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip
sudo mv wordpress/* .
sudo rm -rf wordpress latest.zip
sudo cp wp-config-sample.php wp-config.php

# Update wp-config.php
sudo sed -i "s/database_name_here/$DB_NAME/" wp-config.php
sudo sed -i "s/username_here/$DB_USER/" wp-config.php
sudo sed -i "s/password_here/$DB_PASSWORD/" wp-config.php

# Set permissions
sudo chown -R apache:apache /var/www/html
sudo chmod -R 755 /var/www/html

# Restart Apache
sudo systemctl restart httpd

# Final message
echo "WordPress installation completed. Access your site via the public IP of your EC2 instance."
