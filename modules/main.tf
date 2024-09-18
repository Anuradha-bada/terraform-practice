provider "aws" {
    region = "ap-south-1"
}

module "ec2_instance"{
    source = "./ec2-instance"
    ami_value = "ami-9088382"
    instance_type = "t3.micro"
    subnet_id = "subnet=-991883"
}