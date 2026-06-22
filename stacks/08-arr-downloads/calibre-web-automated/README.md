# calibre-web-automated

Part of the arr download stack — routed through the VPN via `network_mode: "container:gluetun"`.
**Deploy `gluetun` first**; the web UI is published on the gluetun stack. To run without
the VPN, comment `network_mode` and add your own `ports:` + `networks:`. Restart this
container whenever gluetun is recreated.
