
# Agenda 

0) apresentacao modulo e agenda
1) Terraform - o que é
2) infra e exercicios
3) bastiao
4) EKS - Parte 1
5) EKS - Parte 2
6) App - Parte 1 
7) App - Parte 2
8) GKE - Parte 1
9) GKE - Parte 2
10) GKE-App Parte 1
11) GKE-App Parte 2
12) Terraform Cloud
13) Módulos 
14) Módulo S3 - Parte 1 - Código
15) Módulo S3 - Parte 2 - Deploy
16) Módulo RDS - Com SecretManager - Parte 1 - Código
17) Módulo RDS - Com SecretManager - Parte 2 - Deploy
18) ??? 
19) ???
20) Pulumi - EKS - parte 1
21) Pulumi - EKS - parte 2
22) Pulumi - EKS/app - parte 1
23) Pulumi - EKS/app - parte 2



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

cd ./devopsforlife-terraform-to-pulumi/aws/terraform/terraform-kubernetes-deployment/eks-cluster


terraform init


terraform plan


terraform graph -type plan  | dot -Tsvg > graph.svg


terraform apply

terraform destroy


Verificar VPC
Verificar EC2
Verificar EKS

aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output --raw cluster_name)


aws eks --region us-east-1 update-kubeconfig --name test-eks-cluster-FoqKEumc


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
cd ../nodejs-application/

terraform  init

terraform plan

terraform graph -type plan  | dot -Tsvg > graph.svg

terraform apply

kubectl get pods -A
kubectl get deployments -A
kubectl get services -A


terraform destroy
```


# Aula 8 - GKE parte 1

Explicar o terraform





# Aula 9 - GKE parte 2

* Conta nova ?

Já vem as ferramentas no Google Cloud - Explicar.
Ativar a API de INSTANCIAS e do KUBERNETES,
Ativar mais de 500GB para espaço nas maquinas, ou reduzir para apenas 1 máquina.

SSD - cotas - Persistent Storagbe SSD

project-id = gitlab-356218

```sh 
git clone https://github.com/jonathanbaraldi/devopsforlife-terraform-to-pulumi.git

cd ./devopsforlife-terraform-to-pulumi/gcp/terraform/terraform-kubernetes-deployment/gke-cluster

# Atualizar your terraform.tfvars file
vi terraform.tfvars

terraform init

terraform plan

terraform apply


# Pegar as credenciais para o projeto
gcloud config set project gitlab-356218

gcloud container clusters get-credentials gitlab-356218-gke --region us-central1

kubectl get nodes

kubectl get pods -A
kubectl get deployments -A
kubectl get services -A
kubectl  get ns
```


# Aula 10 - GKE App - Parte 1

Código terraform


# Aula 11 - GKE App - Parte 2

```sh


cd ../nodejs-application/

terraform  init

terraform plan

terraform graph -type plan  | dot -Tsvg > graph.svg

terraform apply


kubectl get pods -A
kubectl get deployments -A
kubectl get services -A


terraform destroy

```

# Aula 12 -  Terraform Cloud

# Aula 13 - Módulos 

# Aula 14 - Módulo S3 - Parte 1 - Código
    Pasta aws/terraform-modules-create-s3-bucket

# Aula 15 - Módulo S3 - Parte 2 - Deploy

    Pasta aws/terraform-modules-create-s3-bucket

```sh
terraform init
terraform plan
terraform apply

```    

# Aula 16 - Módulo RDS - Com SecretManager - Parte 1 - Código

Pasta aws/terraform-modules-create-s3-bucket


# Aula 17 - Módulo RDS - Com SecretManager - Parte 2 - Deploy


```sh
terraform init
terraform plan
terraform apply



terraform destroy
```    



