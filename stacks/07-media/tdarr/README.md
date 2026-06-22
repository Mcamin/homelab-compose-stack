# Tdarr

Automated media transcoding / health-checking. Web UI on `8265`, node server on `8266`.
Maps your library from `${MEDIA_ROOT}` read-write (it rewrites files). For hardware
transcoding, uncomment the GPU block (NVIDIA) or add `/dev/dri` for Intel.
