# saksmt.dev kubernetes cluster setup

0. Install k3s (WITHOUT traefik!)
1. Deploy cluster with `./deploy-cluster`
1. Expose & setup SSL termination `./ssl-hosts`
1. Deploy maintenance services: `kubectl apply -f maintenance`
1. Deploy nexus registry: `kubectl apply -f registry`
1. Get nexus registry secret - it lays PV with claim `nexus-data` at path `/admin.password`
1. Go to [nexus](https://registry.saksmt.dev) and setup account
1. Create docker repository in nexus
1. Create docker registry secret `./docker-registry-secret`
1. Clone docker registry secret to all namespaces that need it `./docker-registry-secret`
1. Deploy apps
