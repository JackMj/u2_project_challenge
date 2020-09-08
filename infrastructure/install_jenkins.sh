#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
yum remove -y java
yum install -y java-1.8.0-openjdk

echo "Install Maven"
yum install -y maven 


echo "download kubectl"
curl -o kubectl.sha256 https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.13/2020-08-04/bin/darwin/amd64/kubectl.sha256
openssl sha1 -sha256 kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bash_profile
kubectl version --short --client

echo "Install git"
yum install -y git


echo "Install Terraform"
wget https://releases.hashicorp.com/terraform/0.13.2/terraform_0.13.2_linux_386.zip
unzip terraform_0.12.24_linux_amd64.zip
mv terraform /usr/bin
terraform --version

echo "Install Docker engine"
yum update -y
yum install docker -y
#sudo usermod -a -G docker jenkins
#sudo service docker start
sudo chkconfig docker on

echo "Install nodejs"
yum install nodejs12


echo "Install Angular engine"
npm install -g @angular/cli


echo "Install bcryt"
npm i bcrypt


echo "Install Jenkins"
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins
sudo usermod -a -G docker jenkins
sudo chkconfig jenkins on
sudo service docker start
sudo service jenkins start