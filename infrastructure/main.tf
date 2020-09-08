provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAJG623E2MB3Q643FQ"
  secret_key = "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"
}

resource "aws_instance" "eks_cluster" {
    ami             = "ami-0c94855ba95c71c99"
    instance_type   = "t2.xlarge"
}
