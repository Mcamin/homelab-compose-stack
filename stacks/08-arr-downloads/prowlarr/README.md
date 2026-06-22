# Prowlarr

Part of the arr download stack. Routed through the VPN via `network_mode: "container:gluetun"`.

## Important
- **Deploy `gluetun` first** (see `08-arr-downloads/gluetun`). This container shares
  gluetun's network, so its web UI is reached on the **port published by the gluetun stack**
  (uncomment `PROWLARR_PORT` there).
- If you recreate gluetun, **restart this container** afterwards.
- To run **without** the VPN: comment the `network_mode` line and add your own
  `ports:` (e.g. the default above) and `networks: [shared, proxy]`.
