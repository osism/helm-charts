# helm-charts

```
helm repo add osism https://osism.github.io/helm-charts
helm repo update osism
```

## github-actions-runner

### Adding a self-hosted runner to an organization

* https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners#adding-a-self-hosted-runner-to-an-organization

### Installation

```
helm show values osism/github-actions-runner >> values.yaml
```

```
helm install --generate-name --create-namespace --namespace github-actions-runner --values values.yaml osism/github-actions-runner
```

```
helm list --namespace github-actions-runner
```

```
helm uninstall --namespace github-actions-runner github-actions-runner-1631901178
```

## Notes

### Packaging

```
helm package github-actions-runner
```

### Indexing

```
helm repo index --url https://osism.github.io/helm-charts/ .
```
