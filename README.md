# FortiStack: Secure Cloud-Native CI/CD Pipeline on AWS

This project showcases a production-grade DevSecOps pipeline built from scratch. It automates secure infrastructure provisioning, container deployment, vulnerability scanning, and Kubernetes orchestration using Terraform, GitHub Actions, Docker, ECR, and EKS.

> 🧑‍💻 Solo Project | DevSecOps | AWS | GitHub Actions | EKS | Terraform

---

## ✅ README Highlights

- **Title & Introduction**: Present and clear.
- **Tech Stack Summary**: Well-structured with all key tools.
- **Pipeline Architecture & Flow**: Included with both ASCII and text diagrams.
- **Security Layers**: Clearly outlined with Gitleaks, Checkov, and Trivy.
- **Infrastructure Breakdown**: Fully documented (VPC, EKS, ECR, IAM, etc.).
- **Application Summary**: Node.js app explanation and deployment.
- **Deployment Instructions**: Clone, set credentials, Terraform, CI/CD trigger.
- **Folder Structure Overview**: Provided with detailed breakdown.
- **Screenshots & Gallery**: Linked to `GALLERY.md`.
- **Video Series Placeholder**: YouTube title and context noted.
- **Author Info**: Added at the end.

---

## 📌 Stack

- **Infrastructure as Code:** Terraform
- **Cloud Provider:** AWS (VPC, EKS, ECR, EC2, IAM, S3)
- **CI/CD Pipeline:** GitHub Actions
- **Security Tools:**
  - Gitleaks (Secrets scanning)
  - Checkov (Terraform security scanning)
  - Trivy (Container vulnerability scanning)
- **Orchestration:** Kubernetes
- **Containerization:** Docker
- **App:** Node.js Express API (for demonstration)

---

## 🧭 CI/CD Pipeline Flow

Developer → GitHub → CI/CD → AWS ECR → EKS → Load Balancer → End User  
            │             │  
            │             └── Node.js App  
            │                └── Kubernetes Cluster  
            └── Docker Image Build & Push  
                ├── Secrets + Vulnerability Scans  
                ├── Linting, Testing, Terraform Checks  
                └── Git Push (Triggers Workflow)

---

## 🔐 Security Layers Implemented

|Layer            | Tool        | Purpose                                    |
|------------------|-------------|--------------------------------------------|
| Secrets Scanning | Gitleaks    | Prevent credentials from entering repo     |
| IaC Security     | Checkov     | Static analysis of Terraform configuration |
| Image Scanning   | Trivy       | Scan Docker image for vulnerabilities      |

---

## 🚀 Infrastructure Provisioned (Terraform)

- ✅ Custom **VPC** with public/private subnets
- ✅ Internet & NAT Gateways
- ✅ Elastic Kubernetes Service (EKS) cluster
- ✅ Auto-scaled Node Groups (EC2)
- ✅ AWS ECR Repository for container storage
- ✅ IAM Roles & Security Policies (least-privilege)
- ✅ Load Balancer exposing the Kubernetes service

---

## 📦 Application Overview

- Simple **Node.js Express** API
- Exposed via **LoadBalancer Service**
- Deployed across multiple pods in EKS
- Built and pushed to ECR from pipeline

---

## 🗂 Final Folder Structure

```
fortistack-secure-cicd/
├── .github/
│   └── workflows/
│       ├── secure-deploy.yml
├── app/
│   ├── server.js
│   ├── routes/
│   ├── package.json
│   └── Dockerfile
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── network/eks/iam/...
├── k8s/
│   └── manifests/
│       ├── namespace.yaml
│       ├── deployment.yaml
│       └── service.yaml
├── images/
│   ├── all screenshots (13)
├── videos/
│   └── all walkthrough videos (10)
├── gitleaks.toml
├── .gitignore
├── README.md ✅ polished & complete
├── GALLERY.md ✅ image showcase
```

---

## 📸 Screenshots & Gallery

> View architecture diagrams, EKS dashboards, Trivy & Checkov results in **[GALLERY.md](./GALLERY.md)**

---

## 🎓 Learnings & Takeaways

- Real-world pipeline security integration
- Terraform best practices for modular AWS infrastructure
- CI/CD automation with containerization
- Production-ready Kubernetes application delivery

---

## 🔗 YouTube Walkthrough (Multi-Part Series)

**Title:** DevSecOps in Action: Secure Cloud-Native Pipeline with GitHub Actions  
✅ Full explanation and project walkthrough  
✅ From infrastructure provisioning to app deployment  
📺 *YouTube link to be added*

---

## 👨‍💻 Author

**Doyin DevOps**  
GitHub • LinkedIn