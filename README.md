# CLUSTER
cd infra
# get information about subscription
az account get-access-token --subscription <id>
# deploy
terraform init
terraform plan
terraform apply
# deploy jmeter
terraform output -raw kube_config > ./kubeconfig-aks
export KUBECONFIG=./kubeconfig-aks
kubectl get nodes
kubectl get pods
helm upgrade --install jmeter ./helm/jmeter --namespace jmeter --create-namespace

# delete
terraform destroy



-----
terraform init
terraform plan
terraform validate
terraform apply

terraform output -raw kube_config > ./kubeconfig-aks
export KUBECONFIG=./kubeconfig-aks
kubectl get pods