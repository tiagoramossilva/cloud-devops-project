# ☁️ Cloud DevOps Project — AWS + Terraform + Docker + CI/CD

Hands-on DevOps project simulating a real-world cloud deployment pipeline using AWS, Terraform, Docker, Amazon ECR, and GitHub Actions.

---

## 🚀 Overview

This project demonstrates a modern DevOps workflow where infrastructure is provisioned on AWS using Terraform and application delivery is automated through CI/CD pipelines.

Every push to the `main` branch automatically:

- Builds a Docker image
- Pushes the image to Amazon ECR
- Makes the latest container available for deployment on AWS EC2

---

## 🧱 Architecture

- ☁️ AWS EC2 (Ubuntu)
- 🐳 Docker
- 🏗️ Terraform
- ⚙️ GitHub Actions
- 📦 Amazon ECR
- 🔐 IAM Roles
- 🖥️ AWS Systems Manager (SSM)

---

## 🛠️ Tech Stack

- Python (Flask)
- Docker
- Terraform
- GitHub Actions
- AWS EC2
- AWS ECR
- AWS IAM
- AWS SSM

---

## 🔄 CI/CD Workflow

```text
GitHub Push
     ↓
GitHub Actions Pipeline
     ↓
Docker Image Build
     ↓
Push to Amazon ECR
     ↓
EC2 pulls latest container
```

---

## 📦 Run Locally

### Build Docker image

```bash
docker build -t cloud-app .
```

### Run container

```bash
docker run -p 5000:5000 cloud-app
```

Application available at:

```bash
http://localhost:5000
```

---

## ☁️ Deploy Infrastructure

### Initialize Terraform

```bash
terraform init
```

### Provision AWS resources

```bash
terraform apply
```

---

## 🔐 AWS Resources Provisioned

Terraform provisions:

- EC2 Instance
- Security Group
- IAM Role
- IAM Instance Profile
- SSM permissions
- ECR access permissions

---

## 🧠 Challenges Solved

During development, this project involved troubleshooting and solving real-world cloud issues such as:

- SSH authentication failures
- Docker permission problems
- IAM policy configuration
- ECR authentication
- EC2 runtime setup
- AWS Systems Manager (SSM) access

---

## ✅ Current Status

- ✔ Terraform infrastructure provisioning
- ✔ Docker containerization
- ✔ CI/CD pipeline automation
- ✔ Amazon ECR integration
- ✔ AWS EC2 deployment
- ✔ Flask application running in the cloud

---

## 🎯 Key Learnings

- Infrastructure as Code (IaC)
- Docker container workflows
- AWS cloud provisioning
- IAM roles & permissions
- CI/CD automation
- Cloud debugging & troubleshooting
- Real-world DevOps practices
