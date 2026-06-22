# PostgreSQL

A shared PostgreSQL instance other stacks can use. Reachable by other containers on the
`shared` network as host `postgres`. Keep the host port closed unless you need external
access. Data lives in `${DATA_ROOT}/postgres` — back it up.
