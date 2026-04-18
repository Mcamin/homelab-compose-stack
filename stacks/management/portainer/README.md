# Portainer

Container management UI for Docker-based homelab environments.

## Overview

This stack provides a clean Docker Compose deployment for Portainer with:

- persistent application data
- Docker socket access for local container management
- optional Traefik labels
- optional Watchtower update label
- reusable shared networking

## Notes

- Portainer stores persistent state in `/data`
- Port `9443` is used for the UI/API by default
- Port `8000` is optional and mainly used for Edge features
- If proxying with Traefik, Portainer may require the backend service scheme to be set to `https`

## Networks

- `shared` → general cross-stack communication
- `proxy` → reverse proxy exposure

## References

- Official docs: https://docs.portainer.io/