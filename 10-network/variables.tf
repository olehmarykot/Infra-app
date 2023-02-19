variable "region" {}
variable "environment_name" {}
variable "environment_id" {}
variable "state_bucket" {}
variable "purpose" {}

variable "has_single_nat_gateway" {
    description = "Toggle for environments to use 1 NAT gateway for all AZs"
    type = bool
    default = false
}

variable "zones" {
    type = list(string)
    default = [ "eu-central-1a", "eu-central-1b", "eu-central-1c" ]
    description = "List of availability zones"
}

variable "vpc_cidr" {
    description = "VPC CIDR"  
}

variable "public_zone_name" {
    description = "Public Hosted Zone Name"    
}

variable "private_hosted_zone_name" {
    description = "Private Hosted Zone Name"    
}