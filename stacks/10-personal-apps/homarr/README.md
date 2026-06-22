# Homarr

Customisable homelab dashboard / start page with live service widgets.

## Setup
- `HOMARR_SECRET_ENCRYPTION_KEY` must be 64 hex chars — `openssl rand -hex 32`.
- The Docker socket mount is optional (enables container widgets); drop it for less exposure.
