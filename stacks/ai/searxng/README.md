# SearXNG

Self-hosted metasearch engine used for privacy-respecting web search.

## Overview

This stack provides a Docker Compose deployment for SearXNG with:

- persistent configuration
- centralized environment-driven setup
- optional Traefik integration
- optional Watchtower updates
- compatibility with Open WebUI RAG workflows

---

## Configuration

All configuration is defined in the root `.env` file.

### Required

```env
SEARXNG_BASE_URL=http://searxng:8080
```
---

## Companion Stacks

SearXNG is intended to work with:

- `stacks/ai/open-webui` for optional RAG / web search integration

### Example integration

```env
ENABLE_RAG_WEB_SEARCH=true
RAG_WEB_SEARCH_ENGINE=searxng
SEARXNG_QUERY_URL=http://searxng:8080/search
```

### Notes

* The hostname `searxng` assumes the container is reachable by service name on the shared network
* Open WebUI and SearXNG must share a common Docker network such as `shared`

