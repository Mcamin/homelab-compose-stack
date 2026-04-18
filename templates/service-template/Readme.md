# Service Template

Reusable single-service Docker Compose template for the homelab stack.

## Purpose

Use this template when adding a new standalone service to `stacks/`.

It is designed to keep:
- configuration centralized in `.env`
- service definitions modular
- network usage consistent across stacks

## Conventions

- Replace `your-image:stable` with the actual image
- Replace `your-app` with the real service name
- Replace the volume path with the correct config/data path
- Remove `ports:` if the service is only exposed through a reverse proxy
- Add `proxy` or `internal` networks when needed

## Networks

Default example:
- `shared` → for general service-to-service communication

Optional:
- `proxy` → for reverse-proxy exposed services
- `internal` → for backend-only dependencies