# Third Parties

Sometimes you want someone — or some program — to act near your key without holding the key. These NIPs are the protocol's ways to wrap, delegate, and outsource. They are powerful and easy to get wrong. Read them with a slightly suspicious eye.

NIP-59 is gift wrap: put an event inside a sealed, addressed wrapper so relays and bystanders cannot tell who wrote the inner note or who it is for. Private DMs (NIP-17) depend on this. The wrapper is its own event; the rumor inside is what you actually meant to say.

NIP-46 is remote signing, often called Nostr Connect. A bunker or a signer holds the key; an app asks it to sign. That is how you can use a web client without pasting an `nsec` into the browser. NIP-26 is an older idea, delegated event signing, where a token lets another key sign as you for a while. It is unrecommended: the extra burden is real and the gain is small compared to a remote signer.

NIP-90 is data vending machines: a general job market where you pay a service to produce an event (transcription, translation, image generation, and so on). It is unrecommended. The spec grew until it was trying to be every API at once. Prefer a small, use-case-specific convention over a universal machine.

**In this chapter**

- NIP-59 — Gift wrap
- NIP-46 — Nostr remote signing
- NIP-26 — Delegated event signing (unrecommended; little gain for the complexity)
- NIP-90 — Data vending machines (unrecommended; prefer smaller, specific standards)
