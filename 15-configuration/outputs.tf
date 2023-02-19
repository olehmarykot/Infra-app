output "bastion_ip" {
    value = aws_instance.bastion.*.public_ip  
}
output "ci_cd_ip" {
    value = aws_instance.ci_cd.*.private_ip  
}