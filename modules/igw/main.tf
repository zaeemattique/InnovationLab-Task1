resource "aws_internet_gateway" "Task0_igw_Zaeem" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Task1-IGW-Zaeem"
  }
  
}