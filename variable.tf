#Input variables 
#AWS Region 
variable "aws_region"{
    description = "Region in which AWS Resources are to be created"
    type = string 
    default = "us-east-1"
}

variable "instance_type"{
    description = "Ec2 instance type"
    type = string
    default = "t2.micro"
}

#AWS EC2 instance Key pair
variable "instance_keypair" {
    description = "AWS EC2 Key Pair that needs to be associated with EC2 Instance"
    type = string
    default = "terraform-eks"
}

variable "instance_type_list" {
    description = "EC2 Instance Type"
    type = list(string)
    default = [ "t2.micro", "t2.small", "t2.large"]
}

variable "instance_type_Map" {
    description = "EC2 Instance Type_Map"
    type = map(string)
    default = {
      "dev" = "t2.micro"
      "qa" = "t2.small"
      "prod" = "t2.large"
    }
}