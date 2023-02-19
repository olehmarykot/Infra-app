provider "aws" { 
    region  = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/25"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "192.168.1.0/26"
 
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_instance" "my_infra" {
    ami = "ami-0b0dcb5067f052a63" # Amazon Linux AMI
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public_subnet.id}"
    vpc_security_group_ids = [aws_security_group.my_infra.id]
    user_data              = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform!"  >  /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF

  tags = {
    Name = "My Infrastructure"
    Owner = "Oleh"
    Project = "Terraform Infrastructure"
  }
}