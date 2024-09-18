provider "aws" {
  region = "ap-south-1"
}
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
data "aws_availability_zones" "azs" {
    state = "available"
}
resource "aws_instance" "example" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}

output "azs" {
  value = data.aws_availability_zones.azs
}

output "ami" {
  value = data.aws_ami.latest_amazon_linux
}