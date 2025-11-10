resource "aws_route_table" "Task1_route_table_Zaeem" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "Task1_route_table_Zaeem"
  }
  
}

resource "aws_route_table_association" "Task01_route_table_associationA_Zaeem" {
  subnet_id      = var.subnetA_id
  route_table_id = aws_route_table.Task1_route_table_Zaeem.id
  
}

resource "aws_route_table_association" "Task01_route_table_associationB_Zaeem" {
  subnet_id      = var.subnetB_id
  route_table_id = aws_route_table.Task1_route_table_Zaeem.id
  
}