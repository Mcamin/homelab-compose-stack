# Diun

**Notify-only** image-update watcher. Diun never updates containers — it just tells
you when a newer image is available (great with ntfy). Actively maintained, lightweight.

## Opt-in by label
Diun only watches containers labelled `diun.enable=true`
(`DIUN_PROVIDERS_DOCKER_WATCHBYDEFAULT=false`). Every stack in this repo ships that
label commented out — uncomment it on the services you want notifications for.

## Notes
- Mounts the Docker socket **read-only** (it only reads, never acts).
- Set `DIUN_NTFY_ENDPOINT`/`DIUN_NTFY_TOPIC` (or other Diun notifiers) to get alerts.
- Pairs with **Tugtainer** if you want a UI that can actually *apply* updates.
