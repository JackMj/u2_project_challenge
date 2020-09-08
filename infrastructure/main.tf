provider "aws" {
  region     = "us-east-1"
  access_key = "<ACCESS_KEY_ID>"
  secret_key = "<SECRET_KEY_ACCESS>"
}

resource "aws_instance" "eks_cluster" {
    ami             = "ami-0c94855ba95c71c99"
    instance_type   = "t2.xlarge"
}
