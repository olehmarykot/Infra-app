data "terraform_remote_state" "network" {
    backend = "s3"
    workspace = terraform.workspace
    config = {
      bucket = var.state_bucket
      key = "network/terraform.tfstate"
      region = var.region
     }
}

data "aws_ami" "latest_amazon_linux" {
    owners = ["amazon"]
    most_recent = true
    filter{
        name = "name"
        values = ["amzn2-ami-*-x86_64-gp2"]
    }
}

# data "aws_iam_role" "ssm" {
#     name = "AmazonSSMRoleForInstancesQuickSetup"  
# }

data "aws_iam_policy" "ec2_read_only" {
    name = "AmazonEC2ReadOnlyAccess"  
}

data "aws_iam_policy" "ec2_for_ssm" {
    name = "AmazonEC2RoleforSSM" 
}

data "aws_iam_policy" "ssm" {
    name = "AmazonSSMManagedInstanceCore" 
}