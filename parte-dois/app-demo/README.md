# Demo application installation on Kubernetes with Helm Charts

# This code
* Deploy demo app

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](https://helm.sh/docs/intro/install/) | >= 3.5.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](https://kubernetes.io/pt-br/) | >= 1.20 |

## Using

## Validate code
```
$ helm template app-demo

$ helm lint app-demo
```

## For deploy
```
helm install app-demo app-demo
```