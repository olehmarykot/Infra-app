resource "aws_route53_zone" "private" {
    name = var.private_hosted_zone_name
    vpc {
      vpc_id = aws_vpc.main.id
    }

    tags = {
      Environment = "${var.environment_name} Private Hosted Zone"
    }
}