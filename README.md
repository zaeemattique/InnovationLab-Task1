# WordPress Deployment on AWS using Terraform

## Project Overview
This project automates the deployment of a WordPress website on AWS infrastructure using Terraform. The setup provisions an EC2 instance with Apache, PHP, and MySQL installed via a user data script, configured with a custom VPC, subnets, and security groups.

## Architecture
![alt text](https://raw.githubusercontent.com/zaeemattique/InnovationLab-Task1/refs/heads/main/architecture-diagram.jpg)

The infrastructure includes:

VPC with CIDR: **10.0.0.0/16**

Public Subnets in two availability zones:

Subnet A: **10.0.1.0/24 (us-west-2a)**

Subnet B: **10.0.2.0/24 (us-west-2b)**

Internet Gateway for public internet access

Route Tables with internet routing

Security Groups allowing **HTTP (80), SSH (22), and MySQL (3306)** access

EC2 Instances running Amazon Linux 2023 with WordPress and MySQL

## Prerequisites
Software Requirements
Terraform v1.13.5 or later

AWS CLI configured with appropriate credentials

Git for version control

AWS Requirements
AWS account with appropriate permissions

Access Key ID and Secret Access Key

Default region: us-west-2

## Installation & Setup
1. Install Terraform
Download Terraform from HashiCorp Developer

Create folder C:\Terraform and extract the zip file

Add Terraform to your system PATH

Verify installation:

bash
terraform --version
2. Configure AWS CLI
Download AWS CLI from AWS CLI v2

Run the installer and follow on-screen instructions

Configure AWS credentials:

bash
aws configure
Enter your AWS Access Key ID, Secret Access Key, and set region to us-west-2

## Deployment
Initialize Terraform:
```
terraform init
```
Plan Infrastructure:
```
terraform plan
```
Apply Configuration
```
terraform apply
```
## Infrastructure Components

VPC Configuration
CIDR Block: 10.0.0.0/16

Resource: aws_vpc.Task1_VPC_Zaeem

Subnets
Subnet A: 10.0.1.0/24 in **us-west-2a**
Subnet B: 10.0.2.0/24 in **us-west-2b**

Internet Gateway
Attached to VPC for internet access

Route Table
Default Route: 0.0.0.0/0 → Internet Gateway

Associated with both subnets

Security Groups
Inbound Rules:

HTTP (80) from 0.0.0.0/0

SSH (22) from 0.0.0.0/0

MySQL (3306) from 0.0.0.0/0

Outbound Rules: All traffic

EC2 Instances
AMI: Amazon Linux 2023

Instance Type: t3.micro

Public IP: Enabled

User Data: Automated WordPress and MySQL installation

## User Data Script
The userdata.sh script automates:

System updates and Apache installation

PHP 8.2 and required extensions

MySQL (MariaDB) database setup

WordPress download and configuration

Database user creation and permissions

File permissions and service startup

## State Management
Terraform state is stored in AWS S3 with DynamoDB for state locking:

```
terraform {
  backend "s3" {
    bucket = "task1-zaeem-tfstate"
    key    = "task1/terraform/state/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "task1-zaeem-tfstate-lock"
  }
}
```

## Testing
Access WordPress
After deployment, Terraform will output the public IP

Navigate to http://<PUBLIC_IP> in your browser

Complete WordPress setup wizard

Verify Services
Connect via SSH and check services:
```
systemctl status httpd
systemctl status mariadb
```
## Cleanup
To destroy all created resources:
```
terraform destroy
```
## Author
Zaeem Attique Ashar
Cloud Intern - Cloudelligent
