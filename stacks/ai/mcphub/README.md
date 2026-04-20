# MCPHub

Centralized hub for managing and exposing multiple MCP servers through a single web interface and MCP endpoint.

## Overview

This stack provides a Docker Compose deployment for MCPHub with:

- persistent application data
- mounted MCP server configuration
- centralized environment-driven configuration
- optional Traefik integration
- optional Watchtower updates

## Configuration

All configuration is defined in the root `.env` file.

### Required

```env
MCPHUB_ADMIN_PASSWORD=change_this_password
```

### Optional

```env
########################################
# MCPHub
########################################

MCPHUB_PORT=3000
MCPHUB_DOMAIN=mcphub.example.local
MCPHUB_ADMIN_PASSWORD=change_this_password
```

## MCP Configuration File

This stack mounts:

```text
./mcp_settings.json -> /app/mcp_settings.json
```

The file defines which MCP servers MCPHub manages.

Example:

```json
{
  "mcpServers": {
    "time": {
      "command": "npx",
      "args": ["-y", "time-mcp"]
    }
  }
}
```

## Storage

* Application data is stored in:

  ```
  ${CONFIG_ROOT}/mcphub/data
  ```

## Ports

* `${MCPHUB_PORT}` -> container port `3000`

## Networks

* `shared` -> internal communication
* `proxy` -> reverse proxy exposure

## Endpoints

MCPHub exposes routes such as:

* `/mcp` -> all servers
* `/mcp/{group}` -> specific group
* `/mcp/{server}` -> specific server

## Optional Features

### Traefik

Traefik labels are included but commented in the compose file.

To enable:

* uncomment the `labels` section
* configure `MCPHUB_DOMAIN`
* ensure Traefik is running

### Watchtower

Auto-update support is available via label:

```yaml
# - com.centurylinklabs.watchtower.enable=true
```

## Notes

* If `ADMIN_PASSWORD` is not set, MCPHub generates a random password on first launch and prints it to the logs
* MCP endpoints require authentication by default
* This stack is well suited for pairing with Open WebUI and other MCP-aware clients

## References

* [https://github.com/samanhappy/mcphub](https://github.com/samanhappy/mcphub)
* [https://docs.mcphub.app/](https://docs.mcphub.app/)
