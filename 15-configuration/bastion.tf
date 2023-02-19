resource "aws_instance" "bastion" {
    count = var.bastion_count
    ami = data.aws_ami.latest_amazon_linux.id
    instance_type = var.bastion_instance_type
    subnet_id = data.terraform_remote_state.network.outputs.public_subnet_ids[count.index]
    key_name = var.bastion_key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.sg_bastion.id]
    iam_instance_profile = aws_iam_instance_profile.bastion_profile.id
    user_data = file("./templates/user_data.sh")
    root_block_device {
        volume_size = var.bastion_volume_size
        volume_type = "gp3"
        encrypted = true
    }
    tags = {
        Name = "${var.environment_name} Bastion ${count.index + 1}"
    }
}

resource "null_resource" "copy_to_bastion" {
    count = var.bastion_count
    depends_on = [aws_instance.bastion]
    connection {
      host = aws_instance.bastion[count.index].public_ip
      type = "ssh"
      user = var.bastion_user
      private_key = file(var.bastion_key)
    }
    provisioner "file" {
        source = var.source_bastion_internal_key
        destination = var.destination_bastion_internal_key
    }
    provisioner "remote-exec" {
        inline = ["sudo chmod 400 ${var.destination_bastion_internal_key}"]      
    }
}