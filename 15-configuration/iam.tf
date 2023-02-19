resource "aws_iam_role" "bastion" {
    name = "${var.environment_id}-bastion"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
    EOF
}

resource "aws_iam_role_policy_attachment" "bastion_ec2_for_ssm" {
    role = aws_iam_role.bastion.name
    policy_arn = data.aws_iam_policy.ec2_for_ssm.arn
}

resource "aws_iam_role_policy_attachment" "bastion_ssm" {
    role = aws_iam_role.bastion.name
    policy_arn = data.aws_iam_policy.ssm.arn
}

# bastion instance profile
resource "aws_iam_instance_profile" "bastion_profile" {
    name = "${var.environment_id}-bastion"
    role = aws_iam_role.bastion.name
}

# role for ci/cd
resource "aws_iam_role" "ci_cd" {
      name = "${var.environment_id}-ci-cd"
      assume_role_policy = <<EOF
      {
        "Version": "2012-10-17",
        "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
      }
      EOF
}

resource "aws_iam_role_policy_attachment" "ci_cd_ec2_for_ssm" {
    role = aws_iam_role.ci_cd.name
    policy_arn = data.aws_iam_policy.ec2_for_ssm.arn
}

resource "aws_iam_role_policy_attachment" "ci_cd_ssm" {
    role = aws_iam_role.ci_cd.name
    policy_arn = data.aws_iam_policy.ssm.arn
}

resource "aws_iam_role_policy_attachment" "ci_cd_read_only" {
    role = aws_iam_role.ci_cd.name
    policy_arn = data.aws_iam_policy.ec2_read_only.arn
}

#ci/cd instance profile
resource "aws_iam_instance_profile" "ci_cd_profile" {
    name = "${var.environment_id}-ci-cd"
    role = aws_iam_role.ci_cd.name    
}