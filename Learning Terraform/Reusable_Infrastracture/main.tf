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
resource "aws_vpc" "prod" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.prod.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "subnet"
  }
}
#To use the module within the Terraform configuration, the resource type is declared as a module type. 
#The block label can be any name given to the module block. In this example, it's webserver. 
#The arguments that parametrize the module are included in the module block. 
#The source argument defines the location of the module that is being used. 
#In this case, it's within the child folders of the directory. 
#Next, the arguments that were declared in the variables.tf file are specified. 
#Notice that the subnet_id and security_group_ids arguments are passing information from the aws_vpc and aws_subnet resource blocks. 
#This is how you can pass data into modules:
module "webserver" {
    source = "./modules/ec2"
    servername = "calabvm"
    instance_size = "t2.micro"
    subnet_id = aws_subnet.sub1.id
    security_group_ids = [aws_vpc.prod.default_security_group_id]
}
resource "aws_ec2_tag" "tags" {
  resource_id = module.webserver.id
  key         = "Environment"
  value       = "Production"
}

#notice in the aws_ec2_tag resource block, the module output id is used by specifying module with the module name. 
#In this example, the value of id is declared from the outputs.tf file of the ec2 module. 
#This is how modules can create data and pass it along to other resources: