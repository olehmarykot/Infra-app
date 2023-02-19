module "db" {
    source = "terraform-aws-modules/rds/aws"
    version = "5.3.0"

    create_db_instance          = var.create_db_instance
    create_db_parameter_group   = var.create_db_parameter_group
    parameters                  = var.rds_parameters
    identifier                  = "${var.environment_id}-${var.rds_identifier}"
    engine                      = var.engine
    engine_version              = var.engine_version
    instance_class              = var.rds_instance_class
    allocated_storage           = var.rds_storage_size
    storage_type                = var.rds_storage_type

    db_name = var.db_name
    username = var.username
    port = "3306"

    vpc_security_group_ids = [aws_security_group.sg_rds.id]
    # db subnet group
    create_db_subnet_group = true
    subnet_ids = data.terraform_remote_state.network.outputs.private_subnet_ids

    # db parameter group
    family = var.family
    # db option group
    major_engine_version = var.major_engine_version

    # db deletion protection
    deletion_protection = false
    skip_final_snapshot = true

    tags = {
        Name = "${var.environment_name} ${var.rds_identifier} RDS instance"
    }
    depends_on = [aws_security_group.sg_rds]
}