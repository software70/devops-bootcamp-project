#######################################
# Web Server Outputs
#######################################
output "web_server_public_ip" {
  description = "Elastic IP of the Web Server"
  value       = aws_eip.web_eip.public_ip
}

output "web_server_private_ip" {
  description = "Private IP of the Web Server"
  value       = aws_instance.web.private_ip
}

#######################################
# Ansible Controller Outputs
#######################################
output "ansible_controller_private_ip" {
  description = "Private IP of Ansible Controller"
  value       = aws_instance.ansible.private_ip
}

#######################################
# Monitoring Server Outputs
#######################################
output "monitoring_server_private_ip" {
  description = "Private IP of Monitoring Server"
  value       = aws_instance.monitoring.private_ip
}

#######################################
# ECR Outputs
#######################################
output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.final_project.repository_url
}
