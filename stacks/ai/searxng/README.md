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