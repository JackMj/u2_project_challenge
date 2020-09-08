provider "aws" {
  region     = "us-east-1"
  access_key = "<ACCESS_KEY_ID>"
  secret_key = "<SECRET_KEY_ACCESS>"
}

# resource "aws_key_pair" "terraform-keys2" {
#   key_name = "terraform-keys2"
#   public_key = "terraform-keys2.pub"
# }


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
    user_data = "${file("install_jenkins.sh")}"

    associate_public_ip_address = true
    tags = {
      Name = "jenkins_server"
    }
}

resource "aws_security_group" "sg_allow_ssh_jenkins" {
  name        = "allow_ssh_jenkins"
  description = "Allow SSH and Jenkins inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

