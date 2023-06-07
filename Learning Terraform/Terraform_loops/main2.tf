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


#In the execution plan, the public IP address resource will no longer be created since associate_public_ip_address was set to false. 
#Also, there are now two ebs volumes to be created since an additional map was added to the module configuration:
module "server" {
    source = "./modules/ec2"

    servername = "testserver"
    associate_public_ip_address = false

    ebs_block_device = [
        {
        device_name = "/dev/sdh"
        volume_size = "4"
        volume_type = "standard"
        delete_on_termination = "true"
        },
        {
        device_name = "/dev/sdj"
        volume_size = "4"
        volume_type = "standard"
        delete_on_termination = "true"
        }
    ]

}