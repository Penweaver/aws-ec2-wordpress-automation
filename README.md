# aws-ec2-wordpress-automation

# WordPress Deployment Automation Script for AWS EC2

This repository provides a one-click solution for deploying WordPress on an **Amazon Linux EC2 instance** using the **LAMP stack**. The script automates the setup process, making it easy for anyone to launch a fully functional WordPress site.

---

# Features

- **Automated Deployment**: Installs Apache, MariaDB, PHP, and WordPress in a single run.
- **Database Configuration**: Automatically sets up a secure MariaDB database and user for WordPress.
- **Server Optimization**: Configures permissions and server settings for smooth operation.
- **AWS Free Tier Compatible**: Designed to work within AWS Free Tier limits.


# Requirements

- An Amazon Linux EC2 instance with public access.
- SSH access to the EC2 instance.
- Basic familiarity with AWS and Linux (optional but helpful).


# Quick Start

# *Step 1: Launch an EC2 Instance
1. Log in to your AWS account and launch an Amazon Linux EC2 instance.
2. Open ports **80 (HTTP)** and **22 (SSH)** in the security group.

# Step 2: Connect to the Instance
Use an SSH client to connect to your instance:

ssh -i "your-key.pem" ec2-user@your-instance-public-ip

# Step 3: Run the Script
Run the following command to deploy WordPress:

sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/<your-username>/<repo-name>/main/deploy-wordpress.sh)"

# Step 4: Complete the WordPress Setup
1. Open your browser and navigate to `http://your-instance-public-ip/`.
2. Follow the WordPress installation wizard to set up your site.

# How It Works

The script automates the following steps:
1. Updates system packages and installs LAMP stack components.
2. Secures MariaDB and creates a database and user for WordPress.
3. Downloads and configures the latest version of WordPress.
4. Sets appropriate file permissions for web server operations.
5. Restarts services to apply changes.


# Customization

You can customize the script to:
- Change the database name, user, or password.
- Adjust PHP or Apache configurations.
- Include additional WordPress plugins or themes.

Simply edit the `deploy-wordpress.sh` file to modify the behavior.


# Troubleshooting

- **Cannot connect to the instance**: Ensure your security group allows inbound traffic on port 22 (SSH).
- **Error accessing WordPress**: Check if Apache is running with `sudo systemctl status httpd`.
- **Database issues**: Verify MariaDB credentials in the `wp-config.php` file.


# Contributing

We welcome contributions to improve this script! Feel free to:
- Open issues for bugs or feature requests.
- Submit pull requests with enhancements.


# License

This project is licensed under the [MIT License](LICENSE).



# Support

If you encounter any issues, feel free to open an issue in this repository or reach out to [adu.dare@yahoo.com].



# Made with ❤️ by DARE ADU to simplify WordPress deployments on AWS!
