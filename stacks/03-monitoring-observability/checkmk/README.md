# Checkmk (Raw Edition)

Infrastructure & service monitoring. Web UI at `http://<host>:${CHECKMK_PORT}/cmk/`
(default site id `cmk`, login `cmkadmin` / `CMK_PASSWORD`).

## Notes
- `162/udp` is for SNMP traps — drop it if you don't use SNMP.
- Site data persists in `${DATA_ROOT}/checkmk`.
