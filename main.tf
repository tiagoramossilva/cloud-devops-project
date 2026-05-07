provider "aws" {
  region = "eu-central-1"
}

# -------------------------
# VPC default
# -------------------------
data "aws_vpc" "default" {
  default = true
}

# -------------------------
# Subnets default
# -------------------------
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}



# -------------------------
# SECURITY GROUP
# -------------------------
resource "aws_security_group" "app_sg" {
  name   = "cloud-devops-app-sg"
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

variable "key_name" {
  default = "cloud-devops-key"
}

# -------------------------
# EC2 INSTANCE
# -------------------------
resource "aws_instance" "app_server" {
  ami           = "ami-051eaec1417c5d4ae"
  instance_type = "t3.micro"

  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  key_name = var.key_name

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
# OUTPUTS
# -------------------------
output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.app_server.public_dns
}