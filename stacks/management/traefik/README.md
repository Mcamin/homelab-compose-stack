## Certificate Resolver Options

This stack includes two commented ACME patterns:

### HTTP Challenge
Use this when:
- ports 80 and 443 are publicly reachable
- you want a simple Let's Encrypt setup

### Cloudflare DNS Challenge
Use this when:
- your DNS is hosted on Cloudflare
- you want wildcard certificates
- you prefer DNS-based validation over exposing HTTP challenge flow

### Important
Enable only one ACME challenge method for a given resolver.