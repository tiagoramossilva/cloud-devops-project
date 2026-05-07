# ☁️ Cloud DevOps Project — AWS + Terraform + Docker + CI/CD

Hands-on DevOps project simulating a real-world cloud deployment pipeline using AWS, Infrastructure as Code, containerization, and CI/CD automation.

---

## 🧱 Architecture Overview

- ☁️ AWS EC2 (Ubuntu hosting the application)
- 📦 Docker (Containerized Flask app)
- 🏗️ Terraform (Infrastructure as Code)
- ⚙️ GitHub Actions (CI/CD pipeline)

---

## 🛠️ Tech Stack

- Python (Flask)
- Docker
- AWS (EC2, Security Groups)
- Terraform
- GitHub Actions

---

## 🔄 CI/CD Workflow

1. Developer pushes code to GitHub
2. GitHub Actions triggers pipeline
3. Docker image is built and tested
4. Terraform provisions infrastructure on AWS
5. Application is deployed on EC2

---

## 🚀 Run Locally

docker build -t cloud-app .
docker run -p 5000:5000 cloud-app

Access the app:
http://localhost:5000

---

## ☁️ Infrastructure (Terraform)
- terraform init
- terraform apply

---

## 🎯 Key Learnings
- Infrastructure as Code (Terraform)
- Containerization (Docker)
- CI/CD automation (GitHub Actions)
- AWS EC2 provisioning & networking
- Debugging real cloud deployment issues (SSH, permissions, keys)

CI/CD test working
