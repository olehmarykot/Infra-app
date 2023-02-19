variable "region" {}
variable "environment_name" {}
variable "environment_id" {}
variable "state_bucket" {}
variable "purpose" {}

variable "create_db_instance" {
    default = false
}
variable "create_db_parameter_group" {
    default = false
}
variable "rds_identifier" {}
variable "rds_instance_class" {
    default = "db.t3.micro"
}
variable "engine" {
    default = "mysql"
}
variable "family" {
    default = "mysql8.0"
}
variable "major_engine_version" {
    default = "8.0"
}
variable "rds_storage_size" {
    default = 20
}
variable "rds_storage_type" {
    default = "gp3"
}
variable "engine_version" {
    default = "8.0.31"
}
variable "db_name" {}
variable "username" {}
variable "rds_parameters" {
    type = list(any)
    default = [
        {
            name = "character_set_client"
            value = "utf8mb4"
        },
        {
            name = "character_set_server"
            value = "utf8mb4"
        }
    ]
}