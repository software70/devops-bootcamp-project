#######################################
# Ubuntu 24.04 AMI (ap-southeast-1)
#######################################
data "aws_ssm_parameter" "ubuntu_2404" {
  name = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

#######################################
# IAM Role for SSM
#######################################
resource "aws_iam_role" "ssm_role" {
  name = "devops-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "devops-ssm-profile"
  role = aws_iam_role.ssm_role.name
}

#######################################
# Web Server (Public)
#######################################
resource "aws_instance" "web" {
  ami                         = data.aws_ssm_parameter.ubuntu_2404.value
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  private_ip                  = "10.0.0.5"
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.ssm_profile.name
  associate_public_ip_address = true

  tags = {
    Name = "devops-web-server"
  }
}

#######################################
# Elastic IP for Web Server
#######################################
resource "aws_eip" "web_eip" {
  domain   = "vpc"
  instance = aws_instance.web.id

  tags = {
    Name = "devops-web-eip"
  }
}

#######################################
# Ansible Controller (Private)
#######################################
resource "aws_instance" "ansible" {
  ami                    = data.aws_ssm_parameter.ubuntu_2404.value
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_subnet.id
  private_ip             = "10.0.0.135"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = "devops-ansible-controller"
  }
}

#######################################
# Monitoring Server (Private)
#######################################
resource "aws_instance" "monitoring" {
  ami                    = data.aws_ssm_parameter.ubuntu_2404.value
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_subnet.id
  private_ip             = "10.0.0.136"
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = "devops-monitoring-server"
  }
}
