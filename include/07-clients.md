# Clients

Clients are where Nostr becomes an app: a feed, a profile, a compose box. The protocol does not care what the UI looks like. It does care that two clients can point at the same event, the same profile, and the same relay without inventing their own URL schemes.

NIP-21 is the `nostr:` URI scheme. NIP-19 is the bech32 encoding behind it — `npub`, `nsec`, `note`, `nevent`, `nprofile`, `naddr`, and friends. Together they are how you copy a key or a note out of one app and open it in another. If you have ever pasted an `npub1…` into a client, you have used these two NIPs.

NIP-03 attaches OpenTimestamps proofs to events, so you can later show that a note existed at a certain time. It is unrecommended: the current scheme is vulnerable to a known attack and needs an update. It is still in the book because attestations exist in the wild and the idea is sound.

NIP-BE describes talking to Nostr over Bluetooth Low Energy. It is unrecommended: it was implemented once, it is unclear whether it works well, and it needs review. Local, radio-based transport is an interesting idea. This particular spec is not something to build on yet.

**In this chapter**

- NIP-21 — `nostr:` URI scheme
- NIP-19 — bech32-encoded entities
- NIP-03 — OpenTimestamps attestations (unrecommended; needs an update)
- NIP-BE — BLE communications (unrecommended; experimental and unproven)
