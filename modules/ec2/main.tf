resource "aws_instance" "Task1_EC2_A_Zaeem" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.subnetA_id
  vpc_security_group_ids      = [var.sgA_id]
  associate_public_ip_address = true
  availability_zone = var.AZA
  user_data = file("${path.module}/userdata.sh")


  tags = {
    Name = "Task1_EC2_A_Zaeem"
  }
}

resource "aws_instance" "Task1_EC2_B_Zaeem" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = var.subnetB_id
  vpc_security_group_ids      = [var.sgB_id]
  associate_public_ip_address = true
  availability_zone = var.AZB
  user_data = file("${path.module}/userdata.sh")


  tags = {
    Name = "Task1_EC2_B_Zaeem"
  }
  
}