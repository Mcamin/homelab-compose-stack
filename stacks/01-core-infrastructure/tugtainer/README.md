# Tugtainer

Web-UI updater for standalone / Compose containers (a maintained alternative to
Watchtower, with per-container control and rollbacks).

## How updates are chosen
Unlike Diun, Tugtainer decides what to update **in its UI/database** (per-container,
opt-in), not via an "enable" label. The only label it reads is **protection**:

- `dev.quenary.tugtainer.protected=true` → never stop/update this container.

Tugtainer protects **itself** with that label (above) and you can add it to anything
you want it to leave alone.

## Notes
- Mounts the Docker socket (read/write) so it can recreate containers — keep it internal.
- Set a real `TUGTAINER_AGENT_SECRET`. UI on `http://<host>:${TUGTAINER_PORT}` or via Traefik.
- Use **Diun** alongside it if you also want push notifications.
