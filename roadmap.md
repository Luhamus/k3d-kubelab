Laptop (Fedora)
  |_ Docker
     |_ k3d cluster
         |_ ingress-nginx
            sample app
            ArgoCD
            Prometheus/Grafana
            CI/CD


homelab-platform/
├── README.md
├── docs/
│   ├── architecture.md
│   ├── networking.md
│   └── troubleshooting.md
├── bootstrap/
│   ├── create-cluster.sh
│   └── install-argocd.sh
├── clusters/
│   └── local-dev/
│       ├── apps.yaml
│       └── infra.yaml
├── apps/
│   ├── sample-app/
│   └── whoami/
├── infrastructure/
│   ├── ingress-nginx/
│   ├── prometheus/
│   ├── grafana/
│   └── argocd/
├── helm-values/
├── scripts/
├── .github/workflows/
└── screenshots/
