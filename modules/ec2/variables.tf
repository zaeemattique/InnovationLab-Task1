variable "ec2_ami" {
    description = "The AMI ID for the EC2 instances"
    type        = string  
}

variable "ec2_instance_type" {
    description = "The instance type for the EC2 instances"
    type        = string
}

variable "subnetA_id" {
    description = "Subnet A ID"
}

variable "subnetB_id" {
    description = "Subnet B ID"
}

variable "sgA_id" {
    description = "Security Group A ID"
}

variable "sgB_id" {
    description = "Security Group B ID"
}

variable "AZA" {
    description = "Availability Zone A"
    type        = string
  
}

variable "AZB" {
    description = "Availability Zone B"
    type        = string
  
}