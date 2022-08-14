SECRET_KEY = "aabbcccd"
CONTENT_ORIGIN = "http://213.131.230.23.nip.io"
DATABASES = {
    "default": {
        "HOST": "pulp-postgres",
        "ENGINE": "django.db.backends.postgresql",
        "NAME": "pulp",
        "USER": "pulp",
        "PASSWORD": "password",
        "PORT": "5432",
        "CONN_MAX_AGE": 0,
        "OPTIONS": {
            "sslmode": "prefer"
        }
    }
}
# CACHE_ENABLED is a tech preview
# https://docs.pulpproject.org/pulpcore/configuration/settings.html#cache-enabled
CACHE_ENABLED = True
REDIS_HOST = "pulp-redis"
REDIS_PORT = 6379
REDIS_PASSWORD = ""
ANSIBLE_API_HOSTNAME = "http://213.131.230.23.nip.io"
TOKEN_SERVER = "http://213.131.230.23.nip.io/token/"
TOKEN_AUTH_DISABLED = False
TOKEN_SIGNATURE_ALGORITHM = "ES256"
PUBLIC_KEY_PATH = "/etc/pulp/keys/container_auth_public_key.pem"
PRIVATE_KEY_PATH = "/etc/pulp/keys/container_auth_private_key.pem"
