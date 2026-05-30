## Prerequisites
Following tools need to be installed and working:
`docker `
`kubectl `
`k3d ` 

### Networking
For me, using `Fedora`, i was not able to access internet from my k8s cluster initally.
The fix was adding dns in `/etc/docker/daemon.json`
```
{
  "dns": ["8.8.8.8", "1.1.1.1"],
   ...
```

I also added `hemidal.local` to my `/etc/hosts` file for the convenience of using "localhost" in the browser URL
```
127.0.0.1 localhost ... ... ... hemidall.local
```

## Usage - TODO
- run the setup_script.sh
- open `localhost:8080` on yout browser
