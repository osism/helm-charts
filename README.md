# helm-charts

## Installation

```sh
helm repo add osism https://osism.tech/helm-charts
helm repo update osism
helm show values osism/CHARTNAME > values.yaml
helm install --create-namespace --namespace CHARTNAME CHARTNAME osism/CHARTNAME --values values.yaml
helm uninstall --namespace CHARTNAME CHARTNAME
```

## Packaging

```sh
helm package NAME
```

## Indexing

```sh
helm repo index --url https://osism.tech/helm-charts/ .
```
