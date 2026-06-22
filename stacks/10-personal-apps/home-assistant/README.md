# Home Assistant

Open-source home automation hub.

## Networking note
This template uses a published port + bridge networks, which works for most setups and
plays nicely with Traefik. **However**, local-device discovery (mDNS/Bonjour, HomeKit,
Bluetooth, some Zigbee/Z-Wave) needs **host networking** — switch to `network_mode: host`
(and add USB `devices:` + `privileged: true` for radios) if you rely on those.
