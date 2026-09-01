# Security

Nostr's security model is short: whoever holds the private key *is* the user. There is no password reset, no support desk, and no company that can freeze an account. These NIPs are about keeping that key usable, encrypting payloads so relays cannot read them, and asking the network to forget you if you need to leave.

NIP-44 is versioned payload encryption. It is the crypto underneath modern private messages (NIP-17) and a better default than the scheme in NIP-04. You will rarely implement it as a user-facing feature. You will implement it if you handle secrets on Nostr at all.

Key handling is the rest of the personal side. NIP-06 derives keys from a mnemonic seed phrase. It is unrecommended; the current advice is to treat a single `nsec` as the identity rather than a BIP-39 tree of them. NIP-49 is `ncryptsec`, a way to encrypt a private key with a password so you can back it up without leaving the secret in plaintext. NIP-98 is HTTP authentication: sign a small event to prove you own a key when talking to an ordinary web API.

NIP-62 is a request to vanish. You ask relays to delete everything from your key, including deletion events, and not to take the notes back. Some jurisdictions treat that kind of request as binding. Relays that support it should actually delete. This is as close as Nostr gets to "I want out."

**In this chapter**

- NIP-44 — Encrypted payloads (versioned)
- NIP-06 — Key derivation from a mnemonic (unrecommended; prefer a single `nsec`)
- NIP-49 — Private key encryption (`ncryptsec`)
- NIP-98 — HTTP auth
- NIP-62 — Request to vanish
