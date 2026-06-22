# TradeNote

Self-hosted trading journal. **Requires MongoDB** — deploy the `06-databases/mongodb`
stack first and set `TRADENOTE_MONGO_URI` to point at it (both on the `shared` network).
`APP_ID`/`MASTER_KEY` are arbitrary secrets for its embedded Parse server.
