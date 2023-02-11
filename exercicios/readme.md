
# Agenda 

1) apresentacao modulo e agenda
2) Terraform - o que é
3) Bastiao
4) EKS - Parte 1
5) EKS - Parte 2
6) App - Parte 1 
7) App - Parte 2
8) Módulos customizados
9) Kubernetes manifesto
10) 
20)

21) Pulumi - o que é


# requisitos

Conta na AWS
Conta no GCP
aws-cli
kubectl


# Aula 3 - Bastião


```sh
ssh -i devops2.pem ubuntu@18.224.251.247

sudo apt-get update -y

sudo apt-get install unzip -y

wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint


echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list


sudo apt update


sudo apt install terraform -y

terraform --version
	Terraform v1.3.7


# sudo apt purge terraform -y

# AWS-CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version


# KUBECTL
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
	#// echo "$(cat kubectl.sha256)  kubectl" | sha256sum –check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl --help


sudo apt install graphviz


export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-east-1


aws sts get-caller-identity

```



# Aula 4 - EKS - Parte 1 
Código terraform 


# Aula 5 - EKS - Parte 2 





```sh
cd ~/
pwd
git clone https://github.com/jonathanbaraldi/devopsforlife-terraform-to-pulumi.git

cd ~/aws/terraform/terraform-kubernetes-deployment/

cd ~/aws/terraform/terraform-kubernetes-deployment/eks-cluster


terraform init


terraform plan


terraform graph -type plan  | dot -Tsvg > graph.svg


terraform apply

terraform destroy


Verificar VPC
Verificar EC2
Verificar EKS



aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output --raw cluster_name)


kubectl get nodes

kubectl get pods -A
kubectl get deployments -A
kubectl get services -A
kubectl  get ns
```



# Aula 6 - App - Parte 1

Código terraform

# Aula 7 - App - Parte 2

```sh


cd ~/DevOps/aws/terraform/terraform-kubernetes-deployment/nodejs-application/

terraform  init

terraform plan

terraform graph -type plan  | dot -Tsvg > graph.svg

terraform apply


kubectl get pods -A
kubectl get deployments -A
kubectl get services -A


terraform destroy

```


# Aula 8 - Módulos customizados 












