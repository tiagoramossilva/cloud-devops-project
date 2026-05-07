provider "aws" {
  region = "eu-central-1"
}

# -------------------------
# VPC default (seguro e simples)
# -------------------------
data "aws_vpc" "default" {
  default = true
}

# -------------------------
# Subnet default
# -------------------------
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# -------------------------
# Key Pair (cria a chave corretamente)
# -------------------------
resource "aws_key_pair" "deployer" {
  key_name   = "cloud-devops-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# -------------------------
# Security Group
# -------------------------
resource "aws_security_group" "app_sg" {
  name   = "app-security-group"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -------------------------
# EC2 Instance
# -------------------------
resource "aws_instance" "app_server" {
  ami           = "ami-051eaec1417c5d4ae"
  instance_type = "t3.micro"

  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name               = aws_key_pair.deployer.key_name

  user_data = <<EOF
#!/bin/bash
apt update -y
apt install -y docker.io git

systemctl start docker
systemctl enable docker

git clone https://github.com/tiagoramossilva/cloud-devops-project app
cd app

docker build -t flask-app .
docker run -d -p 5000:5000 flask-app
EOF

  tags = {
    Name = "cloud-devops-project"
  }
}

# -------------------------
# Outputs
# -------------------------
output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.app_server.public_dns
}