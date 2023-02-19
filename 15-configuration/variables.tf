variable "region" {}
variable "environment_name" {}
variable "environment_id" {}
variable "state_bucket" {}
variable "purpose" {}

variable "bastion_count" {
    default = "0"
}
variable "bastion_instance_type" {
    default = "t2.micro"
}
variable "bastion_key_name" {}
variable "my_ip" {}
variable "bastion_volume_size" {
    default = "10"
}
variable "bastion_user" {
    default = "ec2-user"
}
variable "bastion_key" {
    default = "/home/oleh/.ssh/itca-dev.pem"
}
variable "source_bastion_internal_key" {
    default = "/home/oleh/.ssh/github-devops"
}
variable "destination_bastion_internal_key" {
    default = "/home/ec2-user/.ssh/github-devops"
}
variable "ci_cd_count" {
    default = "0"
}
variable "ci_cd_instance_type" {
    default = "t2.micro"
}
variable "internal_key_name" {
    default = "github-devops-pub"
}
variable "internal_key_path" {
    default = "/home/oleh/.ssh/github-devops.pub"
}
variable "ci_cd_volume_size" {
    default = "10"
}