# ☁️ Cloud DevOps Project — AWS + Terraform + Docker + CI/CD

Hands-on DevOps project simulating a real-world cloud deployment workflow using AWS, Infrastructure as Code, containerization, and CI/CD automation.

---

# 🚀 Project Overview

This project demonstrates a complete cloud deployment pipeline built with modern DevOps practices.

The infrastructure is provisioned with Terraform on AWS, the application is containerized using Docker, and the CI/CD pipeline is automated with GitHub Actions and Amazon ECR.

Every push to the `main` branch automatically builds and pushes a new Docker image to AWS ECR.

---

# 🧱 Architecture Overview

- ☁️ AWS EC2 (Ubuntu instance)
- 📦 Docker (Containerized Flask application)
- 🏗️ Terraform (Infrastructure as Code)
- ⚙️ GitHub Actions (CI/CD automation)
- 🐳 Amazon ECR (Docker image registry)
- 🔐 IAM Roles + AWS Systems Manager (SSM)

---

# 🛠️ Tech Stack

- Python (Flask)
- Docker
- AWS EC2
- AWS ECR
- AWS IAM
- AWS Systems Manager (SSM)
- Terraform
- GitHub Actions

---

# 🔄 CI/CD Workflow

1. Developer pushes code to GitHub
2. GitHub Actions pipeline is triggered
3. Docker image is built automatically
4. Image is pushed to Amazon ECR
5. EC2 instance pulls and runs the latest container

---

# 📦 Run Locally

## Build Docker image

```bash
docker build -t cloud-app .
```

## Run container

```bash
docker run -p 5000:5000 cloud-app
```

Access the application:

```bash
http://localhost:5000
```

---

# ☁️ Infrastructure Deployment

## Initialize Terraform

```bash
terraform init
```

## Deploy infrastructure

```bash
terraform apply
```

---

# 🔐 AWS Infrastructure

The Terraform configuration provisions:

- EC2 instance
- Security Group
- IAM Role
- IAM Instance Profile
- SSM permissions
- ECR read permissions

---

# 🎯 Key Learnings

- Infrastructure as Code with Terraform
- Docker containerization
- CI/CD automation using GitHub Actions
- AWS EC2 provisioning
- IAM Roles and permissions
- Amazon ECR integration
- Cloud deployment troubleshooting
- Real-world DevOps debugging

---

# 🧠 Real Challenges Solved

This project also involved solving practical cloud engineering issues such as:

- SSH authentication failures
- Docker permission issues
- IAM permission troubleshooting
- ECR authentication
- EC2 runtime configuration
- AWS Systems Manager (SSM) setup

---

# ✅ Current Status

- ✔ Infrastructure provisioning automated
- ✔ CI/CD pipeline working
- ✔ Docker image build automation
- ✔ Amazon ECR integration
- ✔ Flask application deployed successfully on AWS
