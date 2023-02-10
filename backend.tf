#to store the terraform statefile 
terraform {
  backend "s3" {
    bucket = "dev-terraform-eks"
    key    = "newstate.tfstate"
    region = "us-east-1"
    dynamodb_table="firstproject"
  }
}
