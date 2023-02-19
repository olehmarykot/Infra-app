provider "aws" {
    region = var.region
    default_tags {
        tags = {
            Environment = var.environment_id
            Role = "${var.environment_name} rds"
            Purpose = var.purpose
        }      
    }  
}

terraform {
  backend "s3" {
    region = "eu-central-1"
    bucket = "itca-devops-terraform-forme"
    key = "rds/terraform.tfstate"
    dynamodb_table = "itca-devops-terraform-forme"
  }
}