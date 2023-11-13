provider "aws" {
  region = "us-east-1"  # Specify your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-06aa3f7caf3a30282"  # Specify the AMI ID for your desired operating system
  instance_type = "t2.medium"                 # Specify the instance type

  user_data = <<-EOF
              #!/bin/bash
               sudo apt update -y
               sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
               curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
               sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
               sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
               sudo apt update -y
               sudo apt install docker-ce -y
               sudo apt install nginx -y
               EOF

  key_name = "server-key"

  tags = {
    Name = "Devops-Class"  # Specify the desired name for your instance
  }
}
