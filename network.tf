resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.main.id}"
  
  tags = {
    Name = "internet_gateway"
  }
}

resource "aws_route_table" "public-crt" {
    vpc_id = "${aws_vpc.main.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.internet_gateway.id}" 
    }
}

resource "aws_route_table_association" "crta-public-subnet"{
    subnet_id = "${aws_subnet.public_subnet.id}"
    route_table_id = "${aws_route_table.public-crt.id}"
}

resource "aws_security_group" "my_infra" {
    vpc_id = "${aws_vpc.main.id}"
    name        = "Infrastructure security Group"
    description = "My First Security Group"
 
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }

   ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_infra"
    Owner = "Oleh"
  }
}