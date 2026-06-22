# AdGuard Home

Network-wide DNS ad/tracker blocking and a local DNS server.

## Setup

1. `docker compose up -d`
2. Open the **setup wizard** at `http://<host>:3000` (first run only). Pick an admin
   web port — keep it at **80** inside the container so `ADGUARD_WEB_PORT` maps cleanly.
3. After setup, the admin UI is reachable on `http://<host>:${ADGUARD_WEB_PORT}` (default `8080`),
   or via Traefik at `${ADGUARD_DOMAIN}` once you uncomment the labels.
4. Point your **router's DNS** (or individual devices) at this host's IP to use it.

## ⚠️ Port 53 conflict

Port `53` is DNS. On many Linux hosts `systemd-resolved` already listens on `53` and
the container won't start. Free it first:

```
# /etc/systemd/resolved.conf
[Resolve]
DNSStubListener=no
```
then `sudo systemctl restart systemd-resolved` (and make sure `/etc/resolv.conf` points
somewhere sane). On a dedicated DNS box this isn't an issue.

## Notes

- `conf` holds the configuration, `work` holds runtime data/stats/query logs.
- Only expose the **admin UI** through Traefik — never expose port `53` to the internet.
