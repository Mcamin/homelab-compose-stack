# Stack Template

Reusable multi-service Docker Compose template for application stacks with internal dependencies.

## Purpose

Use this template for setups such as:

- app + database
- app + redis
- app + backend dependency
- services that require readiness-aware startup order

## Included Patterns

- centralized environment loading via `env_file`
- reusable `shared`, `proxy`, and `internal` networks
- `depends_on` with `service_healthy`
- optional Traefik labels
- optional Watchtower labels
- optional app healthcheck
- built-in database healthcheck example

## Network Roles

- `shared` → general cross-stack communication
- `proxy` → reverse proxy exposure
- `internal` → backend-only communication

## Conventions

- Replace `your-image:stable` with the real application image
- Replace `your-app` and `your-db` with service-specific names
- Replace `1234` with the app’s internal port
- Replace `${APP_DOMAIN}` with the service-specific domain variable
- Replace the sample database credentials before real use
- Keep active labels inside a single `labels:` block per service

## Notes

- `depends_on: condition: service_healthy` is useful when an app should wait until a dependency is actually ready
- Keep proxy labels commented unless the service is exposed through Traefik
- Use scoped Watchtower labels only if your Watchtower instance is configured for scoped updates