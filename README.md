# helm-charts

|chart                |description                             |
|---------------------|----------------------------------------|
|aptly                |mirror for deb packages                 |
|bandersnatch         |mirror for pypi packages                |
|github-actions-runner|self-hosted github-actions runner       |
|registry             |mirror for container images             |
|wormhole             |mirror for ansible collections and roles|

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
