# Uptime Kuma

Self-hosted monitoring and status page service for the homelab stack.

## Overview

This stack provides a clean Docker Compose deployment for Uptime Kuma with:

- persistent application data
- centralized environment-driven configuration
- reusable shared networking
- optional reverse proxy compatibility

## Notes

- Uptime Kuma stores its persistent data in `/app/data`
- Use a local directory or volume with proper file locking support
- Port `3001` is exposed by default unless the service is published only through a reverse proxy

## Networks

- `shared` → general cross-stack communication
- `proxy` → reverse proxy exposure

## References

- Official project: https://github.com/louislam/uptime-kuma