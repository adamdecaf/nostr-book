# Nostr Overview

Nostr is a simple protocol for publishing notes and other stuff over the internet. The name stands for "Notes and Other Stuff Transmitted by Relays." There is no company in the middle, no single server that can shut you down, and no username you have to ask permission for. You make a keypair, you write events, and you send those events to relays — ordinary servers that store them and hand them to whoever asks.

Everything in Nostr is an event. An event is a small JSON object: a public key (who), a timestamp (when), a kind number (what), some content, optional tags, and a signature that proves you wrote it. Kind 0 is your profile. Kind 1 is a short text note. Later chapters add kinds for messages, zaps, groups, videos, and a long tail of application-specific things. The shape of the event does not change. New features are almost always a new kind, or a new convention for tags.

Your identity is that keypair. The public key is who you are; the private key is how you sign. Anyone can check a signature. Only you can create one. Relays are intentionally dumb. They accept events, store them, and return them to clients. Clients decide which relays to talk to, which events to show, and how to present them. That split — smart clients, simple relays — is the whole design. If a relay misbehaves, you leave it. If a client is bad, you switch clients. Your keys, and the events you signed, go with you.

The next page is NIP-01, the basic protocol. If you only read one NIP, read that one. It defines events, signatures, the WebSocket messages between clients and relays, and the `REQ` filters that make the rest of this book possible. Everything after it is an optional extension of the same idea.
