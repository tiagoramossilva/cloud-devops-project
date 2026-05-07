# -------------------------
# PROVIDER
# -------------------------
provider "aws" {
  region = "eu-central-1"
}

# -------------------------
# DATA SOURCES
# -------------------------
data "aws_vpc" "default" {
  default = true
}

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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -------------------------
# IAM (SSM)
# -------------------------
resource "aws_iam_role" "ec2_ssm_role" {
  name = "ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-ssm-profile"
  role = aws_iam_role.ec2_ssm_role.name
}

# -------------------------
# EC2
# -------------------------
resource "aws_instance" "app_server" {
  ami           = "ami-051eaec1417c5d4ae"
  instance_type = "t3.micro"

  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = <<EOF
#!/bin/bash
apt update -y
apt install -y docker.io git amazon-ssm-agent

systemctl enable docker
systemctl start docker

systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent

git clone https://github.com/tiagoramossilva/cloud-devops-project app || true
cd app

docker build -t flask-app .
docker run -d -p 5000:5000 flask-app || true
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