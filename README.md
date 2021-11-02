# helm-charts

```sh
helm repo add osism https://osism.github.io/helm-charts
helm repo update osism
```

## github-actions-runner

### Adding a self-hosted runner to an organization

* <https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners#adding-a-self-hosted-runner-to-an-organization>

### Installation

```sh
helm show values osism/github-actions-runner >> values.yaml
helm install --generate-name --create-namespace --namespace github-actions-runner --values values.yaml osism/github-actions-runner
helm list --namespace github-actions-runner
helm uninstall --namespace github-actions-runner github-actions-runner-1631901178
```

## hound

### Purpose

This chart installs a [Hound service](https://github.com/hound-search/hound).
Hound is an extremely fast source code search engine.

### Installation

```sh
helm show values osism/hound >> values.yaml
helm install --create-namespace --namespace hound hound osism/hound --values values.yaml
helm list --namespace hound
helm uninstall --namespace hound hound
```

## smarter-device-manager

### Purpose

This is a chart required by github-actions-runner. It provides e.g. */dev/fuse* file system access.
The only value which should be set is the **nodeSelector**. Your worker nodes need to have this set,
otherwise the daemonset won't deploy.

### Installation

```sh
helm show values osism/smarter-device-manager >> values.yaml
helm install smarter-device-manager --create-namespace --namespace smarter-device-manager --values values.yaml osism/smarter-device-manager
helm list --namespace smarter-device-manager
helm uninstall --namespace smarter-device-manager smarter-device-manager
```

## Notes

### Packaging

```sh
helm package github-actions-runner
helm package hound
helm package smarter-device-manager
```

### Indexing

```sh
helm repo index --url https://osism.github.io/helm-charts/ .
```
