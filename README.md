Cloud DevOps Project — AWS + Terraform + Docker + CI/CD

Hands-on project demonstrating a real-world DevOps workflow using AWS infrastructure, containerization, and CI/CD automation.

🧱 Architecture
AWS EC2 (Ubuntu instance hosting containerized app)
Terraform (Infrastructure as Code)
Docker (Application containerization)
GitHub Actions (CI/CD pipeline)
⚙️ Tech Stack
Python (Flask)
Docker
AWS (EC2, Security Groups)
Terraform
GitHub Actions
📦 Workflow
Developer pushes code to GitHub
GitHub Actions builds and tests Docker image
Infrastructure is provisioned via Terraform
Application is deployed and runs on EC2
🚀 Run locally
docker build -t cloud-app .
docker run -p 5000:5000 cloud-app

Access:

http://localhost:5000
☁️ Infrastructure
terraform init
terraform apply
🔄 CI/CD

Pipeline runs automatically on every push to main.

🎯 Learning Outcomes
Infrastructure as Code with Terraform
Containerization with Docker
CI/CD pipeline implementation
AWS EC2 provisioning and networking
Debugging real-world cloud issues (SSH, keys, users)
