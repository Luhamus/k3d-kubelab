## Create cluster
k3d cluster create mycluster --agents 2 -p "8080:80@loadbalancer" --k3s-arg "--disable=traefik@server:*"

## Install ingress
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

## Create namespaces
kubectl create ns heimdall
kubectl create ns linkding
