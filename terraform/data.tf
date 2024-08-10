data "aws_ssm_parameter" "frontend_sg_id" {
  name = "/${var.project_name}/${var.environment}/frontend_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_id"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "web_alb_listener_arn_https" {
  name = "/${var.project_name}/${var.environment}/web_alb_listener_arn_https"
}


data "aws_ami" "ami_info" {

    owners = ["973714476881"]
    most_recent = true

    filter {
        name = "name"
        values = ["RHEL-9-DevOps-Practice"]
 
    }
    filter {
        name = "root-device-type"
        values = ["ebs"]
    }


    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}