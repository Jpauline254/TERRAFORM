variable "servername"{
    description = "Name of the server"
    type = string
}

#The empty string is the trigger for the conditional logic in main.tf. 
#It allows the user of the EC2 module to omit an AMI ID value and have the module collect an AMI ID value on its own. 
variable "ami" { 
    description = "AMI ID to deploy"
    type = string
    default = ""
}
variable "instance_size" {
    description = "Size of the EC2 instance"
    type = string
    default = "t2.micro"
}