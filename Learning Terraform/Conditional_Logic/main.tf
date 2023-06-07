terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.7"
    }
  }
}
provider "aws" {
  region = "us-west-2"
}

 #the AMI data block runs to find an AMI ID in AWS that meets the filter requirements. 
 #The execution plan shows the resulting AMI ID value:
module "webserver" {
    source = "./modules/ec2"
    servername = "calabvm"
    instance_size = "t2.micro"
}