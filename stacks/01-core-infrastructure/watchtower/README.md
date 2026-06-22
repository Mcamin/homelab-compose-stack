# Watchtower

Automatic Docker image updates. **Opt-in by label** — Watchtower only touches
containers that carry `com.centurylinklabs.watchtower.enable=true`. Every stack in
this repo ships that label commented out; uncomment it on the services you want
auto-updated.

## Notes
- Runs on the `WATCHTOWER_SCHEDULE` cron (default 04:00 daily) and cleans up old images.
- For update notifications, set `WATCHTOWER_NOTIFICATION_URL` (shoutrrr) — e.g. an ntfy URL.
- Mounts the Docker socket (read/write) so it can recreate containers — keep it internal.
