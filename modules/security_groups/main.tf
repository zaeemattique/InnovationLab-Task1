resource "aws_security_group" "Task1_sg_instanceA_Zaeem" {
  name        = "Task1_sg_instanceA_Zaeem"
  description = "Security group for Instance A"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"        # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # allow to all destinations
  }
  
}

resource "aws_security_group" "Task1_sg_instanceB_Zaeem" {
  name        = "Task1_sg_instanceB_Zaeem"
  description = "Security group for Instance B"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"        
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}