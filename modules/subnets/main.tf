resource "aws_subnet" "Task1_SubnetA_Zaeem" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnetA_cidr
  availability_zone = var.AZA

  tags = {
    Name = "Task1_SubnetA_Zaeem"
  }
  
}

resource "aws_subnet" "Task1_SubnetB_Zaeem" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnetB_cidr
  availability_zone = var.AZB

  tags = {
    Name = "Task1_SubnetB_Zaeem"
  }
  
}