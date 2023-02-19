terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "=4.45.0"
    }
  }
  required_version = ">=1.1.0, <=1.3.6"
}