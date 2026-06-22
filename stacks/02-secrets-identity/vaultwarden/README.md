# Vaultwarden

Lightweight, self-hosted, Bitwarden-compatible password manager. Works with all the
official Bitwarden clients (browser, desktop, mobile).

## Setup

1. Set a real `VAULTWARDEN_ADMIN_TOKEN` in your `.env` — `openssl rand -base64 48`.
2. Set `VAULTWARDEN_DOMAIN` to the URL you'll actually use (e.g. `vault.local.example.com`).
3. `docker compose up -d`, open the vault, create your account.
4. Set `VAULTWARDEN_SIGNUPS_ALLOWED=false` and redeploy so no one else can register.
5. Admin page: `https://${VAULTWARDEN_DOMAIN}/admin` (uses the admin token).

## ⚠️ Security notes

- **Always serve over HTTPS.** Browser crypto (WebAuthn/2FA, the web crypto API) requires
  a secure context — that's why `DOMAIN` is built as `https://...`. Put it behind Traefik
  (uncomment the labels) rather than exposing the raw port.
- The `ADMIN_TOKEN` protects the `/admin` panel — treat it like a root password.
- Everything (vault data, attachments, keys) lives in the `/data` volume — **back it up**.

## Notes

- No external database needed — Vaultwarden uses SQLite inside `/data` by default.
