# ntfy

Simple pub/sub push notifications (great target for Diun/Tugtainer, backups, alerts, etc.).

## Setup
- Put server config in `${CONFIG_ROOT}/ntfy/server.yml` (e.g. `base-url`, auth). The
  container listens on `:80` by default; `NTFY_PORT` publishes it on the host.
- Subscribe from the phone app or `curl -d "hi" http://<host>:${NTFY_PORT}/mytopic`.
- Runs as UID 1000 — ensure the config/cache dirs are owned by `1000:1000`.
