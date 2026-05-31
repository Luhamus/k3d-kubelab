# Work in porgress ...

## Prerequisites
Following tools need to be installed and working:
- `docker`
- `kubectl`
- `helm` 
- `k3d` 

### Networking
For me, using `Fedora`, i was not able to access internet from my k8s cluster initally.
`Docker` was looking for the DNS server at the Host's ip (127.0.0.53), which doesn't exist inside the cluster
The fix was adding DNS location explicitly in `/etc/docker/daemon.json`. 
```
{
  "dns": ["8.8.8.8", "1.1.1.1"],
   ...
```

I also added `hemidal.local` to my `/etc/hosts` file for the convenience of using "localhost" in the browser URL
```
127.0.0.1 localhost ... ... ... hemidall.local
```

## Usage (WIP)
- run the setup_script.sh
- open `localhost:8080` on yout browser
- ...
