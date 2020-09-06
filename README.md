#Project prerequisites



#Install java:
--------------------------
yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel -y 



#Install Node:
--------------------------
yum install nodejs12


#Install git:
--------------------------
yum install git -y 



#Install & Run jenkins :
--------------------------
sudo wget -O http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins
sudo yum install jenkins -y
service jenkins start




#Install Terraform:
---------------------------------------
 wget https://releases.hashicorp.com/terraf...
 unzip terraform_0.12.24_linux_amd64.zip
 mv terraform /usr/bin
 terraform --version


#Install docker:
--------------------------------------
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker

#Install kubectl:
--------------------------------------

curl -o kubectl.sha256 https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.13/2020-08-04/bin/darwin/amd64/kubectl.sha256
openssl sha1 -sha256 kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bash_profile
kubectl version --short --client


#aws ARN
=========================================
<sensitive keys>