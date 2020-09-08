provider "aws" {
  region     = "us-east-1"
  access_key = "ACCESS_KEYS"
  secret_key = "AWS_SECRET_KEY"
}

resource "aws_instance" "eks_cluster" {
    ami             = "ami-0c94855ba95c71c99"
    instance_type   = "t2.xlarge"
}
