# saksmt.dev kubernetes cluster setup

K3S + Istio + httpsify as edge proxy (since certmanager integration is broken in istio) + exposure of all those charts and metrics (grafana, kiali, prom, zipkin)

## Prerequisites

 - [local-bin scripts](https://github.com/saksmt/local-bin)
 - ansible
 - public domain name & IP

## Installation

0. Configure your hosts in `inventory/hosts`
1. `ansible-playbook -i inventory prepare-node.yaml`
1. `ansible-playbook -i inventory deploy-cluster.yaml`
1. Create secrets for `istio.kiali`, `istio.grafana`, `istio.prom`, `istio.tracing` in `istio-secrets` namespace via `create-secret`
1. `ansible-playbook -i inventory index.yaml`

You may reuse those scripts for your purpose, just don't forget to change hosts:
 - var: `istio.edge_proxy.exposed_hosts`
 - hostnames throughout `config/istio/maintenance/*.yaml`
