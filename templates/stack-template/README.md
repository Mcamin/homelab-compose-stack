# Stack Template

Reusable multi-service Docker Compose template.

## Use this for

- app + database
- app + redis
- services that depend on another service being healthy

## Conventions

- `shared` for cross-stack communication
- `internal` for backend-only communication
- `depends_on` with `service_healthy` when startup order matters
- central configuration comes from the root `.env`