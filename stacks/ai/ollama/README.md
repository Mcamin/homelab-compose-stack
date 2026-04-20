# Ollama

Self-hosted local model runtime for running LLMs through the Ollama API.

## Overview

This stack provides a Docker Compose deployment for Ollama with:

- persistent model storage
- centralized environment-driven configuration
- optional Traefik integration
- optional Watchtower updates
- optional NVIDIA GPU support

## Configuration

All configuration is defined in the root `.env` file.

### Required

```env
OLLAMA_HOST=0.0.0.0:11434
````

### Optional

```env
########################################
# Ollama
########################################

OLLAMA_PORT=11434
OLLAMA_DOMAIN=ollama.example.local
OLLAMA_HOST=0.0.0.0:11434
OLLAMA_KEEP_ALIVE=5m
OLLAMA_MAX_LOADED_MODELS=1
```

## Storage

* Model data is stored in:

  ```
  ${DATA_ROOT}/ollama
  ```

## Ports

* `${OLLAMA_PORT}` -> container port `11434`

## Networks

* `shared` -> internal communication
* `proxy` -> reverse proxy exposure

## Optional Features

### Traefik

Traefik labels are included but commented in the compose file.

To enable:

* uncomment the `labels` section
* configure `OLLAMA_DOMAIN`
* ensure Traefik is running

### Watchtower

Auto-update support is available via label:

```yaml
# - com.centurylinklabs.watchtower.enable=true
```

### NVIDIA GPU Support

GPU support is included as a commented block in the compose file.

Requirements:

* NVIDIA GPU
* NVIDIA drivers installed on the host
* NVIDIA Container Toolkit configured for Docker

Enable the commented `deploy.resources.reservations.devices` block to request GPU access.

## Notes

* Configuration is environment-driven for portability
* No host-specific values are hardcoded
* The official Ollama Docker image stores models under `/root/.ollama`
* GPU acceleration in Docker requires NVIDIA Container Toolkit

---

## Companion Stacks

Ollama is commonly used with:

- `stacks/ai/open-webui` as the primary user interface
- other local tools that consume the Ollama API over the shared Docker network

### Example integration

```env
OLLAMA_BASE_URL=http://ollama:11434
```

### Notes

* The hostname `ollama` assumes the container is reachable by service name on the shared network
* Open WebUI can use this stack directly when both services are attached to the same network


---
## References

* [https://docs.ollama.com/docker](https://docs.ollama.com/docker)
* [https://github.com/ollama/ollama](https://github.com/ollama/ollama)


