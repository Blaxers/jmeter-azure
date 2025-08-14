kubectl create namespace jmeter
helm install jmeter-slave ./ -f values.yaml --namespace jmeter --create-namespace

helm uninstall jmeter-slave --namespace jmeter


kubectl rollout restart sts jmeter-slave-server
