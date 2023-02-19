# terraform {
#   backend "s3" {
#     region = "eu-central-1"
#     bucket = "itca-devops-terraform-forme"
#     key = "state-bucket/terraform.tfstate"
#     dynamodb_table = "itca-devops-terraform-forme"
#   }
# }

provider "aws" {
  region = var.region
  default_tags {
    tags = {
        Environment = var.environment_id
        Role = "${var.environment_name} State bucket"
        Purpose = var.purpose
    }
  }
}