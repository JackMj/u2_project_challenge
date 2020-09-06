provider "aws" {
  region     = "us-east-1"
  access_key = "AKIASHGUTGNELO3A4VNV"
  secret_key = "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"
}

resource "aws_instance" "eks_cluster" {
    ami             = "ami-0c94855ba95c71c99"
    instance_type   = "t2.xlarge"
}
