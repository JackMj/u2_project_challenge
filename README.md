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







#automation
=========================================
this will spin up a kubernetes eks cluster with use of terraform and jenkins

<root>/
automation/
kubernetes_terraform_cluster_setup/
Jenkinsfile


#Coding
=======================================================

#bacend
===========
this is a simple nodejs backend app that gets data from a mongodb database and expose the api to a frontend app 
it has docker for file and the docker image get built by a jenkinsfile

the pipeline will:

1 build service
2 run unit tests
3 build docker image
4 push image to a repository
5 deploy service to kubernetes

<root>/
coding/backend/node_project




#frontend
===========
this is a basic angular app that connects to an api exposed by a nodejs service
this front application consists of a dockerfile  

<root>/
coding/backend/angular_project


the pipeline will:

1 build service
2 run unit tests
3 build docker image
4 push image to a repository
5 deploy service to kubernetes




#infrastructure
=========================================

this will spin an ec2 instance 