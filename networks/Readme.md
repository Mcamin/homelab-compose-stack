# Networks

This folder contains reusable Docker network definitions for the public homelab stack.

Docker Compose creates a default network for a project automatically, but explicitly defined networks are useful when you want services to communicate across stacks, separate reverse-proxy traffic, or isolate backend-only services. Containers on user-defined bridge networks can communicate by container name, which is one reason they are preferred over the default bridge network. ([Docker Docs](https://docs.docker.com/compose/how-tos/networking/), [Docker Docs](https://docs.docker.com/engine/network/drivers/bridge/))

## Included Networks

### `shared.yml`
General-purpose shared network for services that need to communicate across stacks.

Use this for:
- media services
- management tools
- cross-stack service discovery

### `proxy.yml`
Dedicated network for services exposed through a reverse proxy such as Traefik or Nginx Proxy Manager.

Use this for:
- web-facing applications
- services published behind a central proxy

### `internal.yml`
Backend-only isolated network for private service communication.

Use this for:
- app-to-database traffic
- Redis, PostgreSQL, MariaDB, and similar internal dependencies
- services that should not be reachable outside their internal network

Docker Compose supports `internal: true` for externally isolated networks. ([Docker Docs](https://docs.docker.com/reference/compose-file/networks/))

---

## Files

### `shared.yml`

```yaml
networks:
  shared:
    name: ${SHARED_NETWORK}
    driver: bridge
````

### `proxy.yml`

```yaml
networks:
  proxy:
    name: ${PROXY_NETWORK}
    driver: bridge
```

### `internal.yml`

```yaml
networks:
  internal:
    internal: true
```

---

## Setup

Create the reusable external networks before deploying stacks that reference them as external networks:

```bash
docker network create ${SHARED_NETWORK}
docker network create ${PROXY_NETWORK}
```

If you are not using environment variables in your shell, create them directly by name instead:

```bash
docker network create homelab_shared
docker network create homelab_proxy
```

Docker creates bridge networks by default when no driver is specified, and bridge networks are scoped to a single Docker host. If you need a multi-host network, that moves into Swarm overlay networking rather than standard local bridge networks. ([Docker Docs](https://docs.docker.com/reference/cli/docker/network/create/), [Docker Docs](https://docs.docker.com/engine/swarm/networking/))

You do not need to manually create the `internal` network if it is defined directly inside a Compose project and not marked as external.

---

## Example Usage in a Stack

```yaml
services:
  jellyfin:
    image: jellyfin/jellyfin
    networks:
      - shared
      - proxy

networks:
  shared:
    external: true
    name: ${SHARED_NETWORK}
  proxy:
    external: true
    name: ${PROXY_NETWORK}
```

Compose lets you define named networks at the top level and grant each service access explicitly. External networks are referenced by name rather than created by the Compose project. ([Docker Docs](https://docs.docker.com/reference/compose-file/networks/))

---

## Notes

* Keep network names centralized in `.env`
* Use `shared` for service-to-service communication across stacks
* Use `proxy` only for services meant to be exposed through a reverse proxy
* Use `internal` for backend-only dependencies
* Avoid hardcoding host-specific network names in stack files

## Philosophy

Network definitions should stay portable, minimal, and environment-driven.

````

A small improvement I’d also suggest for the actual files:

`shared.yml`
```yaml
networks:
  shared:
    name: ${SHARED_NETWORK}
    driver: bridge
````

`proxy.yml`

```yaml
networks:
  proxy:
    name: ${PROXY_NETWORK}
    driver: bridge
```

`internal.yml`

```yaml
networks:
  internal:
    driver: bridge
    internal: true
```

That last `driver: bridge` is optional, but it makes the intent more explicit and consistent with the other two. ([Docker Docs](https://docs.docker.com/reference/compose-file/networks/))
