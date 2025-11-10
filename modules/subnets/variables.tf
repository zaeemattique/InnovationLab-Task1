variable "vpc_id" {
  description = "Task1 VPC ID"
}

variable "subnetA_cidr" {
  description = "CIDR Block for Subnet A"
}

variable "subnetB_cidr" {
  description = "CIDR Block for Subnet B"
}

variable "AZA" {
    description = "Availability Zone A"
    type        = string
  
}

variable "AZB" {
    description = "Availability Zone B"
    type        = string
  
}