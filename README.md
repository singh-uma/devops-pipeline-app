End-to-End DevOps CI/CD Pipeline on AWS

## 📌 Project Overview

This project demonstrates an end-to-end DevOps workflow for building, testing, containerizing, and deploying a Spring Boot application on AWS.

The project brings together GitHub, GitHub Actions, Jenkins, Maven, Docker, Amazon ECR, Kubernetes, Amazon EKS, and Terraform into a single DevOps workflow.

The application source code is maintained in GitHub. GitHub Actions is used for Continuous Integration, while Jenkins is used to automate the complete CI/CD process.

Docker is used to containerize the application, Amazon ECR is used to store the Docker image, and Amazon EKS is used to run the application on Kubernetes.

Terraform is used as Infrastructure as Code (IaC) to create and manage the AWS infrastructure required for the project.

---

## 🎯 Project Objectives

The main objectives of this project are:

- Build a Java Spring Boot application
- Manage source code using Git and GitHub
- Automate application testing using Maven
- Build the application using Maven
- Containerize the application using Docker
- Store Docker images in Amazon ECR
- Provision AWS infrastructure using Terraform
- Deploy the application to Amazon EKS
- Manage the application using Kubernetes
- Automate deployment using Jenkins
- Implement a complete CI/CD workflow
- Use reusable Terraform modules
- Understand how application code and cloud infrastructure work together

---

# 🏗️ Project Architecture

```text
                         Developer
                             |
                             v
                          GitHub
                             |
              +--------------+--------------+
              |                             |
              v                             v
       GitHub Actions                    Jenkins
              |                             |
              |                    +--------+--------+
              |                    |        |        |
              |                    v        v        v
              |                 Maven    Maven    Docker
              |                 Test     Build    Build
              |                                      |
              |                                      v
              |                                Amazon ECR
              |                                      |
              |                                      v
              |                                  Amazon EKS
              |                                      |
              |                                  Kubernetes
              |                                      |
              |                                      v
              |                              Spring Boot App
              |
              v
        CI Validation

AWS Infrastructure
                         Terraform
                             |
                             v
                          AWS VPC
                             |
             +---------------+---------------+
             |                               |
        Public Subnets                  Private Subnets
             |                               |
       +-----+------+                  +-----+------+
       |            |                  |            |
      EC2       NAT Gateway           RDS          EKS
                    |                               |
                    |                         Worker Nodes
                    |                               |
                    +-------------------------------+

🔄 Complete CI/CD Flow
Developer
    |
    v
GitHub
    |
    v
Jenkins
    |
    +--> Checkout Source Code
    |
    +--> Maven Test
    |
    +--> Maven Build
    |
    +--> Docker Build
    |
    +--> Amazon ECR Login
    |
    +--> Push Docker Image to ECR
    |
    +--> Connect to Amazon EKS
    |
    +--> Deploy Kubernetes Resources
    |
    +--> Update Application Image
    |
    +--> Wait for Deployment Rollout
    |
    +--> Verify Deployment
    |
    v
Running Application on EKS

Terraform provides the AWS infrastructure underneath this deployment.
🛠️ Technologies Used
Category	Technologies
Application	Java 21, Spring Boot
Build	Maven
Source Control	Git, GitHub
Continuous Integration	GitHub Actions
CI/CD	Jenkins
Containerization	Docker
Container Registry	Amazon ECR
Container Orchestration	Kubernetes, Amazon EKS
Infrastructure as Code	Terraform
Cloud Platform	AWS
Database	Amazon RDS MySQL
Storage	Amazon S3
Networking	Amazon VPC, Subnets, NAT Gateway, Internet Gateway
Operating System	Ubuntu / Linux


📁 Project Structure
devops-pipeline-app/
│
├── .github/
│   └── workflows/
│       └── ci.yml
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── src/
│   ├── main/
│   │   └── java/
│   │       └── com/
│   │           └── example/
│   │               ├── DevOpsApplication.java
│   │               └── controller/
│   │                   └── HealthController.java
│   │
│   └── test/
│
├── terraform/
│   ├── modules/
│   │   ├── ec2/
│   │   ├── rds/
│   │   ├── s3/
│   │   └── vpc/
│   │
│   ├── main.tf
│   ├── eks.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── README.md
│
├── .gitignore
├── Dockerfile
├── Jenkinsfile
├── pom.xml
└── README.md

🚀 Application
The project contains a simple Spring Boot application created to demonstrate the complete DevOps pipeline.
The application exposes two endpoints.
Home Endpoint
GET /

Response:
Hello from DevOps Pipeline!

Health Endpoint
GET /health

Response:
Application is UP

☕ Maven Build
Maven is used for dependency management, testing, and packaging the Spring Boot application.
The Maven configuration is stored in:
pom.xml

Run Tests
mvn clean test

Build the Application
mvn clean package

The application JAR is generated inside:
target/

🐳 Docker
The application is containerized using Docker.
The Docker configuration is defined in:
Dockerfile

The Docker image uses a Java 21 runtime and runs the Spring Boot JAR inside the container.
Build Docker Image
docker build -t devops-app:1.0 .

Run Container Locally
docker run -d \
  --name devops-app-container \
  -p 8081:8080 \
  devops-app:1.0

Test the Application
curl http://localhost:8081/

Health check:
curl http://localhost:8081/health

🔹 GitHub
GitHub is used for source-code management.
The repository contains the complete project:
Application
+
Docker
+
Kubernetes
+
Jenkins
+
GitHub Actions
+
Terraform

The main branch used by the project is:
main

🔹 GitHub Actions CI
GitHub Actions is used for Continuous Integration.
The workflow is located at:
.github/workflows/ci.yml

The workflow runs when code is pushed to the main branch or when a pull request targets main.
CI Process
The workflow performs the following steps:
1. Checkout the source code
2. Set up Java 21
3. Run Maven tests
4. Build the Spring Boot application
5. Build the Docker image
The CI workflow helps verify that the application can be tested, built, and containerized successfully.
🔹 Jenkins CI/CD
Jenkins is used for the complete deployment pipeline.
The pipeline configuration is stored in:
Jenkinsfile

Jenkins Pipeline Stages
Checkout
   |
   v
Test
   |
   v
Build
   |
   v
Docker Build
   |
   v
ECR Login
   |
   v
Push to ECR
   |
   v
Deploy to EKS
   |
   v
Verify

1. Checkout
Jenkins checks out the application source code from GitHub.
2. Test
Maven tests are executed:
mvn clean test

3. Build
The Spring Boot application is packaged:
mvn clean package

4. Docker Build
Jenkins builds the Docker image and tags it using the Jenkins build number.
5. ECR Login
Jenkins authenticates Docker with Amazon ECR using AWS credentials stored securely in Jenkins Credentials.
6. Push to ECR
The Docker image is pushed to the Amazon ECR repository.
7. Deploy to EKS
Jenkins updates the Kubernetes configuration and deploys the application to Amazon EKS.
8. Verify
Jenkins verifies the Kubernetes deployment using:
kubectl get deployment
kubectl get pods
kubectl get service

📦 Amazon ECR
Amazon Elastic Container Registry (ECR) is used as the Docker image registry.
The application image is pushed from Jenkins to ECR.
The image follows the AWS ECR format:
ACCOUNT_ID.dkr.ecr.REGION.amazonaws.com/devops-app:TAG

The repository used by the project is:
devops-app

☸️ Kubernetes
The Kubernetes configuration is stored in:
k8s/

The directory contains:
k8s/
├── deployment.yaml
└── service.yaml

Deployment
The application deployment runs multiple replicas.
The current configuration uses:
2 replicas

The container listens on:
8080

The deployment also defines CPU and memory requests and limits.
Service
The application is exposed using a Kubernetes ClusterIP service.
The service uses port:
8080

A public AWS LoadBalancer was not created for this demonstration environment in order to keep the architecture simpler and reduce additional AWS costs.
☁️ Amazon EKS
Amazon Elastic Kubernetes Service (EKS) is used to run the Kubernetes cluster.
The EKS cluster is:
devops-eks-cluster

The cluster is deployed into the Terraform-created VPC.
The EKS worker nodes are placed in private subnets.
The project uses an EKS managed node group.
The demonstration environment uses Spot capacity for the worker nodes.
🏗️ Terraform Infrastructure
Terraform is used as Infrastructure as Code (IaC) to create and manage the AWS infrastructure.
The Terraform configuration is located in:
terraform/

The infrastructure includes:
- VPC
- Public subnets
- Private subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- EC2
- RDS MySQL
- S3
- EKS
- EKS managed worker nodes
- Security groups
🧩 Terraform Modules
The Terraform project uses reusable modules to keep the infrastructure organized.
terraform/
│
├── main.tf
├── eks.tf
├── provider.tf
├── variables.tf
├── outputs.tf
│
└── modules/
    ├── vpc/
    ├── ec2/
    ├── rds/
    └── s3/

VPC Module
The VPC module creates the networking foundation.
It includes:
- VPC
- Public subnets
- Private subnets
- Route tables
- Internet Gateway
- NAT Gateway
- Elastic IP
The VPC uses:
10.0.0.0/16

Two public subnets and two private subnets are created across two Availability Zones.
EC2 Module
The EC2 module creates:
- EC2 instance
- EC2 security group
The EC2 instance is deployed into a public subnet.
RDS Module
The RDS module creates:
- MySQL RDS instance
- DB subnet group
- RDS security group
The database is deployed into private subnets and is not publicly accessible.
S3 Module
The S3 module creates:
- S3 bucket
- Bucket versioning
- Public access block
The bucket is configured to block public access.
EKS Configuration
The EKS configuration is defined in:
terraform/eks.tf

It creates and configures:
- EKS cluster
- EKS managed node group
- Worker nodes
- EKS networking integration
⚙️ Terraform Commands
Move to the Terraform directory:
cd terraform

Initialize
terraform init

Format
terraform fmt

Check Formatting
terraform fmt -check

Validate
terraform validate

Create Plan
terraform plan

Apply Infrastructure
terraform apply

Destroy Infrastructure
terraform destroy

🔐 Security
Security was considered throughout the project.
Sensitive Terraform files are excluded from GitHub.
The following files are intentionally ignored:
terraform.tfvars
terraform.tfstate
terraform.tfstate.backup
.terraform/

AWS credentials are not hard-coded into the application, Terraform configuration, or Jenkinsfile.
Jenkins uses AWS credentials through Jenkins Credentials.
The Jenkins AWS identity is used for the required ECR and EKS operations.
✅ Project Validation
The project was validated at different stages.
Terraform Formatting
terraform fmt -check

Result:
Passed

Terraform Validation
terraform validate

Result:
Success! The configuration is valid.

Terraform Plan
The final Terraform plan returned:
No changes. Your infrastructure matches the configuration.

This confirms that the Terraform configuration matches the deployed AWS infrastructure.
Kubernetes Verification
The Kubernetes deployment was successfully verified.
The deployment reached:
READY 2/2

The application pods were running successfully with no restart issues during verification.
📊 Project Flow Summary
The complete application delivery process is:
Source Code
     |
     v
   GitHub
     |
     v
GitHub Actions
     |
     +----> Maven Test
     |
     +----> Maven Build
     |
     +----> Docker Build
     |
     v
   Jenkins
     |
     +----> Test
     |
     +----> Build
     |
     +----> Docker Build
     |
     v
 Amazon ECR
     |
     v
 Amazon EKS
     |
     v
 Kubernetes
     |
     v
Spring Boot Application

Terraform manages the AWS infrastructure required underneath this workflow.
🎯 What This Project Demonstrates
This project demonstrates practical knowledge of:
Linux
- Ubuntu
- Shell commands
- File management
- Development environment setup
Git and GitHub
- Git repositories
- Commits
- Branches
- Remote repositories
- GitHub workflows
Java and Maven
- Spring Boot
- Maven builds
- Maven testing
- Application packaging
Docker
- Dockerfile
- Docker image creation
- Containers
- Image tagging
- Container registry integration
Jenkins
- Jenkins Pipeline
- Jenkinsfile
- Pipeline stages
- Jenkins credentials
- Automated deployment
Kubernetes
- Pods
- Deployments
- Services
- Replicas
- Rolling updates
- Rollout verification
AWS
- VPC
- Subnets
- Internet Gateway
- NAT Gateway
- EC2
- ECR
- EKS
- RDS
- S3
- IAM
- Security Groups
Terraform
- Infrastructure as Code
- Terraform modules
- Variables
- Outputs
- AWS provider
- Terraform state
- Terraform plan
- Terraform validation
💡 Key Learning
The main learning from this project was understanding how different DevOps tools work together rather than learning each tool independently.
The project connects:
GitHub
   ↓
GitHub Actions
   ↓
Jenkins
   ↓
Maven
   ↓
Docker
   ↓
Amazon ECR
   ↓
Amazon EKS
   ↓
Kubernetes
   ↓
Spring Boot Application

Terraform provides the AWS infrastructure required for the complete environment.
This project also provided practical experience with troubleshooting CI/CD failures, AWS authentication, Docker integration, Kubernetes deployment, Terraform configuration, and infrastructure management.
🧹 AWS Cleanup
AWS resources can generate charges while they are running.
When the project is no longer required, first review the Terraform plan:
cd terraform
terraform plan

Then destroy the Terraform-managed infrastructure:
terraform destroy

After the Terraform destroy, review AWS resources that may have been created or managed outside Terraform, such as:
- Amazon ECR repository and images
- Jenkins IAM resources
- EKS access configuration
These should also be removed when they are no longer required.
