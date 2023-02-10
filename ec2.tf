
#Resource: EC2 Instance 
resource "aws_instance""myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  #instance_type = var.instance_type_list[1] #This is for List
  #instance_type = var.instance_type_Map["prod"] #This is for Map

  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ 
    aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id 
    ]
  count = 2
  #for_each = toset(data.aws_availability_zones.my_azones.names)
  #availability_zone = each.key
  tags = {
    "Name" = "EC2 Demo"
    "instance" = "count-demo-${count.index}"
    #"Env" = "for-each-Demo-${each.key}" #This is valid when creating a set of strings and values
  }
}
#count = 5
#count.index = 0, 1, 2, 3, 4
