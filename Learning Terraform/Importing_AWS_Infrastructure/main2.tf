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
#After import, get this resource block from the terraform show command
#All arguments that cannot be managed by terraform have to be removed, you can get them from the terraform apply command

resource "aws_vpc" "dev" {
    arn                              = "arn:aws:ec2:us-west-2:131649786772:vpc/vpc-0b94aafc4b19b532f"
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "192.168.100.0/24"
    default_network_acl_id           = "acl-0039e6bb08f702cca"
    default_route_table_id           = "rtb-0ba70b47f9abbb521"
    default_security_group_id        = "sg-0df567bd4b0dfd9e8"
    dhcp_options_id                  = "dopt-07ac0b45037c99aa6"
    enable_classiclink               = false
    enable_classiclink_dns_support   = false
    enable_dns_hostnames             = true
    enable_dns_support               = true
    id                               = "vpc-0b94aafc4b19b532f"
    instance_tenancy                 = "default"
    main_route_table_id              = "rtb-0ba70b47f9abbb521"
    owner_id                         = "131649786772"
    tags                             = {
        "Name"                        = "Web VPC"
        "ca-creator"                  = "system"
        "ca-environment"              = "production"
        "ca-environment-session-id"   = "1904156"
        "ca-environment-session-uuid" = "43db470d-24c3-444b-85f7-328f2974b880"
        "ca-external-account-id"      = "5fb421b64b3602071b5a538f"
        "ca-external-user-id"         = "610e3f47201c5c18c7d30a85"
        "ca-laboratory-id"            = "683"
        "ca-persistent"               = "false"
        "ca-scope"                    = "lab"
    }
}

