# End-To-End-CICD-Project

![image_alt](https://github.com/laidevopslearning/End-To-End-CICD-Project/blob/cb73b031bdaa1f8628153c3af9d5ca8e4425e3b0/Flow.png)

![image_alt](https://github.com/laidevopslearning/End-To-End-CICD-Project/blob/40aeaeead6bc2cd340aaf7cfa67957a91bd39090/Resource.png)

## Information
- GitHub (Code)
- Docker (Containerization)
- Jenkins (CI)
- OWASP (Dependency check)
- SonarQube (Quality)
- Trivy (Filesystem Scan)
- ArgoCD (CD)
- Redis (Caching)
- AWS EKS (Kubernetes)
- Helm (Monitoring using grafana and prometheus

| Installation & Setup Step | 
| -------- | 
| Jenkins Master |
| eksctl |
| Argocd |
| Jenkins-Worker Setup |
| OWASP setup |
| SonarQube |
| Email Notification Setup |
| Monitoring |
| Clean Up |



# Create by using Terraform code 
- Create 1 Master machine on AWS with 2CPU, 8GB of RAM (t2.large) and 29 GB of storage and install Docker on it.

# Installation command ( in EC2 )
```
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update -y
sudo apt-get install trivy -y
```
