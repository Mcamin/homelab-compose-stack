# Service Template

Reusable single-service Docker Compose template for the homelab stack.

## Purpose

Use this template when adding a new standalone service under `stacks/`.

It is designed to keep:
- configuration centralized in `.env`
- service definitions modular
- network usage consistent across stacks
- optional proxying and auto-update labels easy to enable

## Included Patterns

- shared environment loading via `env_file`
- reusable `shared` and `proxy` networks
- optional Traefik labels
- optional Watchtower label
- optional healthcheck block

## Conventions

- Replace `your-image:stable` with the actual image
- Replace `your-app` with the service name
- Replace `1234` with the service’s internal port
- Replace `${APP_DOMAIN}` with the service-specific domain variable
- Remove `ports:` if the service is exposed only through Traefik
- Enable labels only when needed

## Notes

- Keep all active labels inside a single `labels:` block
- Use service-specific healthchecks rather than generic ones
- Prefer environment-driven paths over hardcoded host paths