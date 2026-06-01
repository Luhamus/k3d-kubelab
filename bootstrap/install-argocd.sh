#!/usr/bin/env bash
set -euo pipefail

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd --namespace argocd --set server.service.type=ClusterIP --create-namespace -f bootstrap/argocd-values.yaml

# Apply ingress once argocd is up
kubectl wait --namespace argocd --for=condition=ready pod --selector=app.kubernetes.io/name=argocd-server --timeout=180s
kubectl apply -f bootstrap/argocd-ingress.yaml
