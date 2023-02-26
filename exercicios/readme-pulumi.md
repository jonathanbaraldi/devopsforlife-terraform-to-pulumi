readme-pulumi.md


curl -fsSL https://get.pulumi.com | sh

pulumi version

configure aws-cli
configure kubectl
configure helm



git clone https://github.com/pulumi/examples.git

cd ./examples/aws-py-eks/




https://www.pulumi.com/docs/reference/cli/pulumi_login/

$ pulumi login file://~

will store your state information on your computer underneath ~/.pulumi. It is then up to you to manage this state, including backing it up, using it in a team environment, and so on




pulumi login file://~


# AQUI
mkdir quickstart && cd quickstart && pulumi new aws-python
pulumi new aws-python


FAZER O PASSO A PASSO

Copiar os arquivos.



pulumi config set aws:region us-east-2









1.  View the cluster name via `stack output`:

    ```
    $ pulumi stack output
        Current stack outputs (1):
        OUTPUT                   VALUE
        cluster-name  eks-cluster-96b87e8
    ```    

1.  Verify that the EKS cluster exists, by either using the AWS Console or running `aws eks list-clusters`.

1. Update your KubeConfig, Authenticate to your Kubernetes Cluster and verify you have API access and nodes running.

```
$ aws eks --region us-east-2 update-kubeconfig --name $(pulumi stack output cluster-name)

aws eks --region us-east-2 update-kubeconfig --name eks-cluster-a0fbff1

eks-cluster-a0fbff1

    Added new context arn:aws:eks:us-east-2:account:cluster/eks-cluster-96b87e8
```




```
$ kubectl get nodes

    NAME                                         STATUS   ROLES    AGE   VERSION
    ip-10-100-0-182.us-east-2.compute.internal   Ready    <none>   10m   v1.14.7-eks-1861c5
    ip-10-100-1-174.us-east-2.compute.internal   Ready    <none>   10m   v1.14.7-eks-1861c5
```








!!!!! Editar 

pulumi new aws-python






pulumi up







https://app.pulumi.com/cli-login?cliSessionDescription=Generated+by+pulumi+login+on+ip-172-31-33-26+at+26+Feb+23+10%3A58+UTC&cliSessionNonce=31f63894dc09f112c86ed823345db9539f211fb1b4531b1642ce6983c86a4235&cliSessionPort=41699


criar a stack- 


export AWS_ACCESS_KEY_ID=AKIA6KIIWV2JRPLFINW3 && export AWS_SECRET_ACCESS_KEY=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



!
pulumi stack init python-eks-testing
 colocar senhas...


pulumi up
- colocsar senha - 






criar virtual env

Instalar python 3
! apt install python3.10-venv



python -m venv .env
source myenv/bin/activate
pip install -r requirements.txt




sudo apt install python3-venv python3-pip


python3 -m venv .env
source .env/bin/activate
pip3 install -r requirements.txt








default

export AWS_PROFILE=default

pulumi config set aws:profile default



