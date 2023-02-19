// secutity groups
resource "aws_security_group" "private" {
    vpc_id = aws_vpc.main.id
    dynamic "ingress" {
        for_each = [ "22", "80" ]
        content {
            from_port        = ingress.value
            to_port          = ingress.value
            protocol         = "tcp"
            cidr_blocks      = [aws_vpc.main.cidr_block]
        }      
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = [aws_vpc.main.cidr_block]  
    }

    dynamic "egress" {
        for_each = [ "53", "443" ]
        content {
            from_port        = egress.value
            to_port          = egress.value
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
        }        
    }

    tags = {
        Name = "${var.environment_name} Private Security Group"
    }
}