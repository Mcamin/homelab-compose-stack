# Jellyfin

Free media server (movies, TV, music). Maps your library from `${MEDIA_ROOT}` into
`/data/...` inside the container.

## Notes
- Set `JELLYFIN_DOMAIN` and point the libraries at `/data/movies`, `/data/tv`, `/data/music` in setup.
- **Hardware transcoding** is optional — uncomment the `/dev/dri` device for Intel QSV/VAAPI
  (or use the NVIDIA runtime). Without it, transcoding is CPU-only.
- Port `7359/udp` is just LAN auto-discovery; drop it if you don't want it.
