# Open WebUI

Self-hosted AI interface for local and API-backed language models.

## Overview

This stack provides a Docker Compose deployment for Open WebUI with:

- persistent application data
- centralized environment-driven configuration
- optional Traefik integration
- optional Watchtower updates
- support for local (Ollama) and external API backends
- optional RAG (retrieval-augmented generation) via web search

---

## Configuration

All configuration is defined in the root `.env` file.

### Required

```env
OPEN_WEBUI_SECRET_KEY=replace_with_a_long_random_secret
OLLAMA_BASE_URL=http://ollama:11434
````

---

### Optional: RAG / Web Search (SearXNG)

Open WebUI can integrate with external search engines for retrieval-augmented responses.

```env
########################################
# Open WebUI - RAG / Web Search
########################################

ENABLE_RAG_WEB_SEARCH=false
RAG_WEB_SEARCH_ENGINE=searxng
RAG_WEB_SEARCH_RESULT_COUNT=3
RAG_WEB_SEARCH_CONCURRENT_REQUESTS=10
SEARXNG_QUERY_URL=http://searxng:8080/search
```

#### Notes

* Set `ENABLE_RAG_WEB_SEARCH=true` to enable the feature
* `SEARXNG_QUERY_URL` assumes a container named `searxng`
* Both Open WebUI and SearXNG must share the same network (e.g. `shared`)
* The service name must match the hostname used in the URL

---

### Optional: External API Backend

```env
# OPENAI_API_BASE_URL=https://api.example.com/v1
```

---

### Optional: Host-based Services

If using services running on the host instead of Docker:

```env
OLLAMA_BASE_URL=http://host.docker.internal:11434
```

You may need to enable the following in the compose file:

```yaml
# extra_hosts:
#   - host.docker.internal:host-gateway
```

---

## Storage

* Application data is stored in:

  ```
  ${CONFIG_ROOT}/open-webui
  ```

---

## Ports

* `${OPEN_WEBUI_PORT}` → container port `8080`

---

## Networks

* `shared` → internal service communication
* `proxy` → reverse proxy (Traefik)

---

## Optional Features

### Traefik

Traefik labels are included but commented in the compose file.

To enable:

* uncomment the `labels` section
* ensure Traefik is running
* set `OPEN_WEBUI_DOMAIN` and `TRAEFIK_CERTRESOLVER` in `.env`

---

### Watchtower

Auto-update support is available via label:

```yaml
# - com.centurylinklabs.watchtower.enable=true
```
---
## Companion Stacks

This stack is designed to integrate cleanly with other AI services in this repository.

### Recommended pairings

- `stacks/ai/ollama` for local model inference
- `stacks/ai/searxng` for optional web search in RAG workflows

### Reference flow

```text
User -> Open WebUI -> Ollama
                  -> SearXNG
````

### Example related configuration

```env
OLLAMA_BASE_URL=http://ollama:11434
ENABLE_RAG_WEB_SEARCH=true
RAG_WEB_SEARCH_ENGINE=searxng
SEARXNG_QUERY_URL=http://searxng:8080/search
```

### Notes

* The hostnames `ollama` and `searxng` assume matching service names or network aliases
* All services must share a common Docker network such as `shared`
* This stack can run standalone, but it is most useful when paired with one or both companion stacks

---
## References

* [https://github.com/open-webui/open-webui](https://github.com/open-webui/open-webui)
* [https://docs.openwebui.com/](https://docs.openwebui.com/)

