## Prerequisites
docker
kubectl
k3d

### Docker connectivity
For me, using `Fedora`, i was not able to access internet from my k8s cluster initally.
The fix was adding dns in `/etc/docker/daemon.json`
```
{
  "dns": ["8.8.8.8", "1.1.1.1"],
   ...
```

## TODO
