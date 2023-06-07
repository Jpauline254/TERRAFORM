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


#An empty aws_vpc resource block is created as a place holder for the existing VPC in AWS.
# Once the resource is imported into a state file, this resource will need to be modified with the proper arguments:
resource "aws_vpc" "dev" {}
