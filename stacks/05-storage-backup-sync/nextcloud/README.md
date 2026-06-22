# Nextcloud

Self-hosted file sync & share, bundled with its MariaDB database, a Redis cache, and the
background-cron container (Nextcloud needs all four).

## Setup
- Set all the `*_PASSWORD` values in `.env`.
- `NEXTCLOUD_TRUSTED_DOMAINS` must include the hostname you actually browse to.
- Behind a reverse proxy you may also need `OVERWRITEPROTOCOL=https` / `OVERWRITECLIWEBROOT`
  — see the Nextcloud docs.
- The `internal` network keeps the DB/Redis private; only the app is on `shared`/`proxy`.
