terraform {
  required_version = "1.9.5"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=4.33.0"
    }
  }
}