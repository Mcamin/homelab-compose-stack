# Infisical

Self-hosted secrets manager, bundled with its required Postgres + Redis.

## Setup
- `INFISICAL_ENCRYPTION_KEY` = `openssl rand -hex 16`; `INFISICAL_AUTH_SECRET` = `openssl rand -base64 32`.
- `SITE_URL` is built from `INFISICAL_DOMAIN` and should be the URL you actually browse to.
- DB/Redis stay on the private `internal` network. Back up `${DATA_ROOT}/infisical/db`.
