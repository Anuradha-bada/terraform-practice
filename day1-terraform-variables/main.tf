resource "aws_instance" "example12" {
    ami = var.ami
    instance_type = var.type
}
resource "aws_s3_bucket" "bucket12" {
    bucket = var.bucketname
}
resource "aws_iam_user" "env_user" {
    name = "${var.username}-user"
}
resource "aws_iam_group" "env_group" {
    name = "${var.groupname}-group"
}
resource "aws_iam_user_group_membership" "example2" {
  user = aws_iam_user.env_user.name

  groups = [
    aws_iam_group.env_group.name
  ]
}

output "public_ip" {
    value = aws_instance.example12.public_ip
     description = "The Public IP address of the example vm"
}
output "public_dns" {
    value = aws_instance.example12.public_dns
}