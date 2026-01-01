terraform {
  backend "s3" {
    bucket = "devops-bootcamp-terraform-saffuan"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}
