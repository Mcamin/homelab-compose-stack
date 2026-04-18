#!/usr/bin/env bash
set -euo pipefail

find stacks templates -name "compose.yml" | while read -r file; do
  echo "Validating $file"
  docker compose -f "$file" config >/dev/null
done

echo "All compose files validated."