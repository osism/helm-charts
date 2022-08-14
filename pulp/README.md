# Getting ready to develop

Create yourself a kubernetes cluster (gardener is favorable).
Create an nginx ingress which can be used

```sh
helm install --namespace nginx --create-namespace ingress-nginx ingress-nginx/ingress-nginx
```

Install the helm chart with the respective names set in the `settings.py` file (CONTENT_ORIGIN, ANSIBLE_API_HOSTNAME, TOKEN_SERVER) and with the modified `values.yaml` file.

```sh
helm install --namespace pulp --create-namespace pulp --values ./pulp/values.yaml ./pulp
```

If you want to uninstall pulp again, use these commands:

```sh
herlm uninstall pulp --namespace pulp; kubectl delete ns pulp
```

Monitor the deployment status by watching the `api` container logs and wait for them to finish. I currently use `k9s`.

Use the pulp CLI (needs to be configured before using) to start testing.
The below commands create mirror of a container with the name `quay-io-osism-osism`.

```sh
pulp container repository create --name quay-io-osism-osism; pulp container remote create --name quay-io-osism-osism --url https://quay.io --upstream-name osism/osism; pulp container repository sync --name quay-io-osism-osism --remote quay-io-osism-osism; pulp container distribution create --name quay-io-osism-osism --base-path quay-io-osism-osism --repository quay-io-osism-osism --public
```

To be able to use the image, your docker daemons needs to allow insecure registries (or better said: your insecure registry).

Download the image to see if it works:

```sh
docker pull 213.131.230.23.nip.io/quay-io-osism-osism:latest
```

Again watch the api container logs as well as the output of the command itself. Happy debugging!
