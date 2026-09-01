# Developers

The last chapter is for people writing clients. Users should never paste a private key into a website. These NIPs are the seams between an app, a signer, and the rest of the network.

NIP-07 is `window.nostr`, a JavaScript object a browser extension injects so a web app can request a public key, signatures, and encryption without seeing the `nsec`. NIP-55 is the Android equivalent: an intent-based signer application that other apps can call. Together they are how "log in with Nostr" works without turning every frontend into a wallet.

NIP-89 is recommended application handlers. A client publishes the kinds it knows how to open; another client can send a user there instead of rendering a blob it does not understand. That is how a specialized app (a chess board, a wiki, a calendar) gets traffic from a general-purpose feed.

NIP-31 is about dealing with unknown events: a `hint` field so a client can tell a user what an unfamiliar kind is supposed to be. It is unrecommended — unnecessarily bloated — but you will still see the idea discussed, which is why it is here. The better instinct is NIP-89: if you do not know how to render something, point at software that does.

**In this chapter**

- NIP-07 — `window.nostr` for browsers
- NIP-55 — Android signer application
- NIP-89 — Recommended application handlers
- NIP-31 — Dealing with unknown events (unrecommended; unnecessarily bloated)
