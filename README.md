# Work in porgress ...

## Prerequisites
Following tools need to be installed and working:
- `docker`
- `kubectl`
- `helm` 
- `k3d` 

## Networking
For me, using `Fedora`, i was not able to access internet from my k8s cluster initally.
`Docker` was looking for the DNS server at the Host's ip (127.0.0.53), which doesn't exist inside the cluster
The fix was adding DNS location explicitly in `/etc/docker/daemon.json`. 
```
{
  "dns": ["8.8.8.8", "1.1.1.1"],
   ...
```

For now, I added the apps to my `/etc/hosts` file for to open them easilly with browser:
```
127.0.0.1 localhost ... ... ... hemidall.local linkding.local argocd.local grafana.local prometheus.local
```

### Additional info
- Argocd HTTPS is diasbled and redirected to HTTP
<br/>

# Cluster install & usage (WIP)
- run the setup_script.sh
- open `localhost:8080` on yout browser
- ... TODO ...

### ArgoCD
To get the initial generated password for ArgoCD (username is `admin`), run the following command:
```
k get -n argocd secrets argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d && echo
```


### Grafana and Prometheus


### TODO
