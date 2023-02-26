
# Aula 20 - Pulumi


# Aula 21 Pulumi - EKS - parte 2


Instalar:
1. Pulumi
2. Kubectl
3. Helm
4. AWS-CLI







```sh
ssh -i devops2.pem ubuntu@18.224.251.247

# Python3
sudo apt install python3-venv python3-pip


# Pulumi
curl -fsSL https://get.pulumi.com | sh

pulumi version


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


export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-east-2


aws sts get-caller-identity

```





https://www.pulumi.com/docs/reference/cli/pulumi_login/

```sh
pulumi login file://~

# will store your state information on your computer underneath ~/.pulumi. It is then up to you to manage this state, including backing it up, using it in a team environment, and so on

# Iniciando
mkdir aws-py-eks && cd aws-py-eks 

pulumi new aws-python

# Fazer wizard
# Copiar os arquivos.

pulumi config set aws:region us-east-2

pulumi preview

pulumi up 

```


1.  View the cluster name via `stack output`:

    ```
    $ pulumi stack output
        Current stack outputs (1):
        OUTPUT                   VALUE
        cluster-name  eks-cluster-96b87e8
    ```    

1.  Verify that the EKS cluster exists, by either using the AWS Console or running `aws eks list-clusters`.

1. Update your KubeConfig, Authenticate to your Kubernetes Cluster and verify you have API access and nodes running.

```sh
$ aws eks --region us-east-2 update-kubeconfig --name $(pulumi stack output cluster-name)

aws eks --region us-east-2 update-kubeconfig --name eks-cluster-a0fbff1

eks-cluster-a0fbff1

    Added new context arn:aws:eks:us-east-2:account:cluster/eks-cluster-96b87e8
```


```sh
$ kubectl get nodes

    NAME                                         STATUS   ROLES    AGE   VERSION
    ip-10-100-0-182.us-east-2.compute.internal   Ready    <none>   10m   v1.14.7-eks-1861c5
    ip-10-100-1-174.us-east-2.compute.internal   Ready    <none>   10m   v1.14.7-eks-1861c5
```







