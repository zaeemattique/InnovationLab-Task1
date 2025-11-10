resource "aws_vpc" "Task1_VPC_Zaeem" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Task1_VPC_Zaeem"
  }
}