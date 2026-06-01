## Create cluster
k3d cluster create mycluster --agents 2 -p "8080:80@loadbalancer" --k3s-arg "--disable=traefik@server:*"

## Install ingress
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

## Wait for ingress-nginx to be ready
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s

## Install ArgoCD
./bootstrap/install-argocd.sh

## Deploy the Apps
kubectl wait --namespace argocd --for=condition=ready pod --selector=app.kubernetes.io/name=argocd-server --timeout=180s
kubectl apply -f clusters/dev/apps.yaml
