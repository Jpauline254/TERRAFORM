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

#This will test out the module's ability to optionally take AMI ID input.

module "webserver" {
    source = "./modules/ec2"
    ami = "ami-0528a5175983e7f28"
    servername = "calabvm"
    instance_size = "t2.micro"
}