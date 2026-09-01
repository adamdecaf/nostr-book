# Communication

Most people meet Nostr as a feed of short notes. NIP-10 is that feed: kind 1 text notes, plus the `e` and `p` tags that turn a pile of notes into threads. A subject line (NIP-14) is optional. When a note is too small, NIP-23 defines long-form articles, and NIP-24 collects extra profile and note metadata that clients have grown used to.

Not every reply belongs in a kind 1 thread. NIP-22 comments can hang off almost any event — an article, a video, a product listing — without taking over the original conversation. Picture-first feeds (NIP-68), video events (NIP-71), and voice messages (NIP-A0) give those conversations other shapes. NIP-92 describes how to attach media so clients can display it well. Drafts (NIP-37) let you keep unfinished work encrypted until you are ready to publish.

Messaging has a few flavors. Public messages (NIP-A4) are plaintext notes aimed at someone, meant for notification screens rather than a chat history. Private direct messages (NIP-17) are the current recommendation for DMs; they sit on top of the encryption in NIP-44, which appears later in the security chapter. The older encrypted DM scheme (NIP-04) is unrecommended — the encryption is weak by modern standards. NIP-EE's MLS-based messaging is unrecommended too, superseded by the [Marmot protocol](https://github.com/marmot-protocol/marmot) outside this repository.

Two housekeeping NIPs round out the chapter. NIP-40 lets an event expire so relays can drop it. NIP-09 is how you ask relays to delete something you published. Neither is a guarantee — relays can ignore you — but they are the protocol's polite way of saying "I'm done with this."

**In this chapter**

- NIP-10 — Text notes and threads
- NIP-14 — Subject tag in text events
- NIP-23 — Long-form content
- NIP-24 — Extra metadata fields and tags
- NIP-22 — Comments
- NIP-68 — Picture-first feeds
- NIP-71 — Video events
- NIP-A0 — Voice messages
- NIP-92 — Media attachments
- NIP-37 — Draft events
- NIP-A4 — Public messages
- NIP-17 — Private direct messages
- NIP-04 — Encrypted direct messages (unrecommended; use NIP-17)
- NIP-EE — MLS messaging (unrecommended; superseded by Marmot)
- NIP-40 — Expiration timestamp
- NIP-09 — Event deletion request
