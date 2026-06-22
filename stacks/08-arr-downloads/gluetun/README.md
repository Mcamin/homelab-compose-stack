# Gluetun — VPN gateway for the arr download stacks

Every download/indexer service in `08-arr-downloads` routes its traffic through this
VPN container using `network_mode: "container:gluetun"`. This is how you get
"one stack per service" while still sharing a single VPN tunnel.

## ⚠️ The contract (read this — the other stacks depend on it)

1. **Deploy gluetun FIRST.** Services using `network_mode: "container:gluetun"` won't
   start unless the `gluetun` container already exists.
2. **gluetun owns the ports.** A container sharing gluetun's network namespace **cannot
   publish its own ports** — so each service's web-UI port is published **here**, in
   gluetun's `ports:` list. Uncomment the line for each service you run.
3. **Restart dependents after gluetun.** If gluetun is recreated (update, restart), the
   dependent containers lose their network — restart them afterwards.
4. **To skip the VPN** for a given service, comment its `network_mode` line and give it
   normal `ports:` + `networks:` instead (see each service's README).

## Setup
- Fill in your provider's WireGuard key/address (`GLUETUN_WIREGUARD_*`). Most VPNs that
  support WireGuard work; named providers can skip the custom keys — see the
  [gluetun wiki](https://github.com/qdm12/gluetun-wiki).
- Set `GLUETUN_LAN_SUBNET` to your LAN so you can open the UIs from other devices.
- Verify the tunnel: `docker logs gluetun` should show it connected and the IP check pass.
