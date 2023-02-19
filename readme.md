terraform init
terraform workspace list
terraform workspace new dev
terraform workspace select dev

terraform plan -var-file=./terraform-itca-dev.tfvars -var-file=./../common-variables/terraform-itca-dev.tfvars
terraform apply -var-file=./terraform-itca-dev.tfvars -var-file=./../common-variables/terraform-itca-dev.tfvars
terraform destroy -var-file=./terraform-itca-dev.tfvars -var-file=./../common-variables/terraform-itca-dev.tfvars