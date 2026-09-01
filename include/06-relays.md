# Relays

Relays are the boring part of Nostr, on purpose. A relay speaks WebSocket, stores events, and answers `REQ`s. Clients choose which relays to use. That only works if relays can describe themselves, if clients can prove who they are, and if the network can find live servers instead of a hardcoded list.

NIP-11 is the relay information document: a JSON blob at the relay URL that names the server, the NIPs it supports, and any limits or fees. NIP-42 is authentication — `AUTH` — so a relay can know which key it is talking to. Protected events (NIP-70) build on that: an event marked `-` should only be published by its author, which stops other people from copying it onto every relay they can find. NIP-43 is how a relay advertises membership, roles, and join or leave requests, useful when access is not wide open.

Finding and choosing relays is its own problem. NIP-65 is how a user publishes the relays they write to and read from, so other people can find their notes. NIP-66 is relay discovery and liveness monitoring: events that say "this relay exists and I probed it." Search (NIP-50) and counting (NIP-45) are optional extras a relay may offer. NIP-67 lets a relay hint whether an `EOSE` means "that's all I have" or "that's all for now." NIP-77 is negentropy, a set-reconciliation trick so a client and a relay can sync missing events without downloading everything. NIP-86 is an HTTP API for relay operators to manage bans, allow lists, and other admin work.

NIP-48 covers bridged events — notes that originated somewhere else (another protocol, another network) and landed on Nostr with enough metadata to point back at the source.

**In this chapter**

- NIP-11 — Relay information document
- NIP-42 — Client authentication
- NIP-70 — Protected events
- NIP-43 — Relay access metadata and requests
- NIP-65 — Relay list metadata
- NIP-66 — Relay discovery and liveness
- NIP-50 — Search
- NIP-45 — Counting results
- NIP-67 — EOSE completeness hint
- NIP-77 — Negentropy syncing
- NIP-86 — Relay management API
- NIP-48 — Bridged events
