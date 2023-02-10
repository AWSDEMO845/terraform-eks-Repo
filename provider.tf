#Terraform Block - defines the terraform version and provider version used
#Source is the primary location to download provider plugins

terraform {
    required_version = "~> 1.3"
    required_providers {
      aws = {
        source = "hashicorp/aws"
      version = "~> 3.0"
      }
    }
}

#Provider Block 
provider "aws" {
  region = var.aws_region
}

