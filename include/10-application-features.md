# Application Features

Nostr's event shape is boring on purpose. Almost any app can be "a kind, some tags, and some content." This chapter is the long tail of those apps: calendars, live rooms, wikis, files, git, games. You do not need them to speak the protocol. You need them if you are building that particular thing, or if you want your client to open it when someone else did.

Time and performance come first. NIP-52 is calendar events and RSVPs. NIP-53 is live streaming and audio spaces, including live chat. NIP-F4 is podcasts — episodes and metadata that a Nostr client can treat as a show, not just a file link.

Then publishing. Highlights (NIP-84) let you quote a passage and point back at the source. NIP-54 is a wiki. NIP-C0 is code snippets. NIP-73 is how to name something that lives off-Nostr — an ISBN, a DOI, a URL — so different clients can talk about the same book or paper. NIP-34 is git: repositories, patches, issues, and status, so you can host a workflow on relays instead of only on GitHub. NIP-5A is static websites (nsites), a way to publish a site as Nostr events.

Commerce and files sit together because both are about objects you might want to find later. NIP-15 is a full marketplace. It is unrecommended: too complicated; try classified listings (NIP-99) instead. File metadata (NIP-94) describes a blob. NIP-96 is HTTP file storage integration; it is unrecommended and replaced by Blossom (NIP-B7), which is how most new clients move images and video. NIP-35 is torrents.

Two playful NIPs show how far a kind can stretch. NIP-64 is chess games recorded as PGN. NIP-CC is geocaching. NIP-78 is the escape hatch: application-specific data, a place for an app to stash its own state without pretending the rest of the network understands it.

**In this chapter**

- NIP-52 — Calendar events
- NIP-53 — Live streaming and spaces
- NIP-F4 — Podcasts
- NIP-84 — Highlights
- NIP-54 — Wiki
- NIP-C0 — Code snippets
- NIP-73 — External content IDs
- NIP-34 — git stuff
- NIP-5A — Static websites (nsites)
- NIP-15 — Marketplace (unrecommended; try NIP-99)
- NIP-99 — Classified listings
- NIP-94 — File metadata
- NIP-96 — HTTP file storage (unrecommended; replaced by Blossom)
- NIP-B7 — Blossom
- NIP-35 — Torrents
- NIP-64 — Chess (PGN)
- NIP-CC — Geocaching
- NIP-78 — Application-specific data
