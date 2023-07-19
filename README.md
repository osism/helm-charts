# helm-charts

|chart                |description                             |
|---------------------|----------------------------------------|
|github-actions-runner|self-hosted github-actions runner       |

## Installation

```sh
helm repo add osism https://osism.github.io/helm-charts
helm repo update osism
helm show values osism/CHARTNAME > values.yaml
helm install --create-namespace --namespace CHARTNAME CHARTNAME osism/CHARTNAME --values values.yaml
helm uninstall --namespace CHARTNAME CHARTNAME
```

## Packaging

```sh
helm package aptly
helm package bandersnatch
helm package github-actions-runner
helm package registry
helm package wormhole
```

## Indexing

```sh
helm repo index --url https://osism.github.io/helm-charts/ .
```
