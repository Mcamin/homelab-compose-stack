# Semaphore (Ansible UI)

Web UI to run Ansible playbooks/inventories. This template uses the **embedded BoltDB**
(zero external dependencies) — for heavier use, switch `SEMAPHORE_DB_DIALECT` to
`postgres`/`mysql` and point it at one of the `06-databases` stacks.

## Setup
- `SEMAPHORE_ACCESS_KEY_ENCRYPTION` must be a 32-byte base64 key: `head -c32 /dev/urandom | base64`.
- Mount your playbooks/inventory under `${CONFIG_ROOT}/semaphore/...`.
