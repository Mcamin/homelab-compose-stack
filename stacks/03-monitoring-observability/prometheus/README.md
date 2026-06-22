# Prometheus (+ node-exporter + cAdvisor)

Metrics collection for the homelab. Bundled because they're a single logical unit:

- **prometheus** — scrapes & stores metrics (config in `prometheus.yml`, edit to add targets).
- **node-exporter** — host metrics (CPU, RAM, disk, network).
- **cadvisor** — per-container metrics.

## Setup
- Point Grafana at `http://prometheus:9090`.
- `cadvisor` needs `privileged` + `/dev/kmsg`; on some hosts `systemd-resolved`/AppArmor
  may need tweaks. node-exporter uses `pid: host`.
- Add scrape targets by editing `prometheus.yml`, then restart the prometheus container.
