#######################################
# Web Server Security Group (Public)
#######################################
resource "aws_security_group" "public_sg" {
  name        = "devops-public-sg"
  description = "Allow HTTP from internet and SSH from VPC"
  vpc_id      = aws_vpc.devops_vpc.id

  ###################################
  # Inbound Rules
  ###################################
  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from VPC only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  # Added for Prometheus
  ingress {
    description = "Node Exporter from VPC"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }


  ###################################
  # Outbound Rules
  ###################################
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-public-sg"
  }
}

#######################################
# Private Security Group (Ansible + Monitoring)
#######################################
resource "aws_security_group" "private_sg" {
  name        = "devops-private-sg"
  description = "Allow SSH from VPC only"
  vpc_id      = aws_vpc.devops_vpc.id

  ###################################
  # Inbound Rules
  ###################################
  ingress {
    description = "SSH from VPC only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  ###################################
  # Outbound Rules
  ###################################
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-private-sg"
  }
}