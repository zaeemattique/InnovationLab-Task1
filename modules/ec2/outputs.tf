output "EC2-A-ID" {
  description = "The ID of EC2 Instance A"
  value       = aws_instance.Task1_EC2_A_Zaeem.id
  
}

output "EC2-B-ID" {
  description = "The ID of EC2 Instance B"
  value       = aws_instance.Task1_EC2_B_Zaeem.id
  
}