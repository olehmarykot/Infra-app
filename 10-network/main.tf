provider "aws" {
  region = var.region
  default_tags {
    tags = {
        Environment = var.environment_id
        Role = "${var.environment_name} Networking"
        Purpose = var.purpose
    }
  }
}

terraform {
  backend "s3" {
    region = "eu-central-1"
    bucket = "itca-devops-terraform-forme"
    key = "network/terraform.tfstate"
    dynamodb_table = "itca-devops-terraform-forme"
  }
}