terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.7.0"
    }
  }
}

#The data block is a data resource type that is used to collect data from the provider. 
#In this case, the data block is of the aws_ami resource type, 
#which means the block is used to collect the available AMI in the AWS environment. 
#The filter and owner arguments are used to specify the AMI type to retrieve:
data "aws_ami" "default" {
  most_recent = "true"
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

#The resource block aws_instance contains the logic for the AMI to use. 
#The logic within the expression is called a conditional expression. 
#It follows the following format:

#condition ? true : false

#The condition is if the variable AMI does not contain an empty string. 
#If it is true, then set the AMI to the value of var.ami. 
#If it is false, set the value of the AMI to the ID of data.aws_ami.default[0].image_id which is the AMI ID that was collected in the data block. 
#This strategy gives the module the ability to take in AMI ID input or find an AMI on its own and makes the module more dynamic:


resource "aws_instance" "server" {
    ami           = var.ami != "" ? var.ami : data.aws_ami.default.image_id
    instance_type = var.instance_size
    tags = {
        Name = "calabvm"
    }
}
