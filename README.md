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


# Update
- sudo apt-get update
- sudo apt-get install docker.io docker-compose-v2 -y
- sudo chmod 777 /var/run/docker.sock
# Java Installation
- sudo apt update
- sudo apt install fontconfig openjdk-17-jre -y
#Jenkins Installation
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
#AWS CLI Install
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install 
aws configure
#Kubectl Install
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client
#Eksctl install
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
#Trivy install
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update -y
sudo apt-get install trivy -y
#SonarQ install
docker run -itd --name SonarQube-Server -p 9000:9000 sonarqube:lts-community
