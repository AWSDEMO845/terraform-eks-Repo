data "aws_ami" "amzlinux2" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"] #here put the AMI-Name and can search for this under AMI tab in terraform
  }

  filter {
    name   = "root-device-type" #You can get this when you click on create instance in AWS
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

 filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}