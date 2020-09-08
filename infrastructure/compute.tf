provider "aws" {
  region     = "us-east-1"
  access_key = "ACCESS_KEYS"
  secret_key = "AWS_SECRET_KEY"
}



data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = [
      "amzn2-ami-hvm-*-x86_64-gp2",
    ]
  }
  filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
  }
}

resource "aws_instance" "jenkins_server" {
    instance_type   = "t2.xlarge"
    ami             = "${data.aws_ami.amazon-linux-2.id}"
    key_name        = "${var.keyname}"
    user_data = "${file("install_jenkins.sh")}"

    associate_public_ip_address = true
    tags = {
      Name = "jenkins_server"
    }
}
