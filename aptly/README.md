# Initial steps

During deployment, the main container get's stuck, waiting for the init container.
Connect to the init container and execute the following:

```sh
gpg1 --gen-key
gpg1 --export --armor --output /opt/aptly/public/gpgkey OSISM
```

Answer the prompts like this:

- <RETURN>
- <RETURN>
- <RETURN>
- y<RETURN>
- OSISM<RETURN>
- <RETURN>
- <RETURN>
- O<RETURN>
- Super_s3cret
- Super_s3cret

## HINT

These containers are intended to be executed within a kubernetes cluster!
