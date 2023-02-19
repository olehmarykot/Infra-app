resource "aws_route53_record" "rds_dns" {
    zone_id = data.terraform_remote_state.network.outputs.private_zone_id
    name = "${var.environment_id}-${var.rds_identifier}"
    type = "CNAME"
    ttl = "300"
    records = [module.db.db_instance_address]
}