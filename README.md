# DevOps Bootcamp Final Project 2025  
## 🏗️ Architecture Overview
**Project Name:** devops-bootcamp-project

This project demonstrates a complete DevOps workflow using Infrastructure as Code, configuration management, containerization, monitoring, and secure access.

### Components
- AWS VPC with public & private subnets
- EC2 instances:
  - Web Server (Public)
  - Ansible Controller (Private)
  - Monitoring Server (Private)
- Dockerized web application
- Prometheus & Grafana for monitoring
- Cloudflare DNS & Tunnel for secure access
- GitHub Pages & Wiki for documentation
  
 ### 🔗 Project URLs
- [Web Application](http://web.software70.com)
- [Monitoring (Grafana)](https://monitoring.software70.com)
- [GitHub Repository](https://github.com/software70/devops-bootcamp-project)

---

## ⚙️ Infrastructure Provisioning (Terraform)

- Terraform backend stored in S3
- Public subnet: Web Server + Elastic IP
- Private subnet: Ansible Controller & Monitoring Server
- Security groups
- Amazon ECR for container image storage

## 🔧 Configuration Management (Ansible)

- Ansible Controller manages all servers
- Docker installed using Ansible
- Web application deployed via Docker container
- Monitoring stack deployed using Docker

## 📊 Monitoring & Observability

- Node Exporter installed on Web Server
- Prometheus collects:
  - CPU usage
  - Memory usage
  - Disk usage
- Grafana dashboards visualize metrics in real time

## 🔐 Domain & Secure Access

- Domain managed via Cloudflare
- Grafana exposed securely using Cloudflare Tunnel
- Monitoring server has no public access

## 🚀 CI/CD 

- GitHub Pages auto-deploys documentation
- Docker image built & pushed to ECR using GitHub Actions

---

## ✅ Acknowledgements

Thank you for all your support, [@opariffazman](https://www.github.com/opariffazman), [@infratify](https://www.github.com/infratify).
