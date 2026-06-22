# Grafana

Dashboards and visualization (Grafana OSS). Pairs well with the Prometheus stack as a
data source.

## Setup
- Set `GRAFANA_ADMIN_PASSWORD` in `.env` (first-login admin password).
- Runs as UID 1000 — make sure `${DATA_ROOT}/grafana` is owned by `1000:1000`.
- Add Prometheus as a data source at `http://prometheus:9090` (put both on the `shared` network).
