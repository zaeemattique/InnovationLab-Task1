variable "ec2_ami" {
    description = "The AMI ID for the EC2 instances"
    type        = string  
}

variable "ec2_instance_type" {
    description = "The instance type for the EC2 instances"
    type        = string
}


variable "subnetA_cidr" {
  description = "CIDR Block for Subnet A"
}

variable "subnetB_cidr" {
  description = "CIDR Block for Subnet B"
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
  
}

variable "AZA" {
    description = "Availability Zone A"
    type        = string
  
}

variable "AZB" {
    description = "Availability Zone B"
    type        = string
  
}