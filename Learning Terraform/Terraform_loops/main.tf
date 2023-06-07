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


module "server" {
    source = "./modules/ec2"

    servername = "testserver"
    associate_public_ip_address = true

    #The input for the list of maps variable created in the EC2 module
    #Since only one map was specified, only one ebs_block_device is created:
    ebs_block_device = [
        {
        device_name = "/dev/sdh"
        volume_size = "4"
        volume_type = "standard"
        delete_on_termination = "true"
        }
    ]

}