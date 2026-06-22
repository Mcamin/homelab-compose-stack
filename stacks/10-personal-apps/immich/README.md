# Immich

Self-hosted photo & video backup (Google Photos alternative). Bundled with its required
parts: the server, the machine-learning service (search/face detection), a Valkey (Redis)
cache, and Immich's own Postgres image.

## Setup
- Set `IMMICH_UPLOAD_LOCATION` (where originals are stored) and the DB password.
- **Image tags:** server/ML use `:release`; the DB uses Immich's custom Postgres image —
  check the [Immich release notes](https://github.com/immich-app/immich/releases) for the
  exact DB tag that matches your server version before upgrading.
- ML runs CPU-only here; add the NVIDIA runtime + the `-cuda` ML image for GPU acceleration.
- DB/Redis/ML stay on the private `internal` network.
