variable "region" {
    description = "Region in which AWS Resources to be created"
    type = string
    default = "ap-south-1"
}
variable "ami" {
    type = string
    default = "ami-89098"
    validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "The iami value must be a valid AMI id, starting with \"ami-\"."
  }
}
variable "type" {
  default = "t2.micro"
  
}

variable "bucketname" {
  default = "myterraformtestbucket2024"
}

variable "username" {
  
}
variable "groupname" {
  
}