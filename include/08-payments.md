# Payments

Nostr does not have a built-in currency. What it has is events that can request, prove, or discover a payment. Lightning showed up first. Ecash showed up later. The NIPs in this chapter are how clients wire those systems onto keys and notes without turning the protocol into a ledger.

NIP-57 is Lightning zaps: a standardized way to send sats to a note or a profile and publish a receipt. Zap goals (NIP-75) put a fundraising target on an event so a client can show progress. NIP-47, Nostr Wallet Connect, lets an app talk to a wallet it does not hold — you approve payments from a signer you already trust, instead of pasting invoices around.

Cashu is the other half. NIP-60 is a Cashu wallet stored as Nostr events, so your unspent tokens can move with your key. NIP-61 is nutzaps: zaps paid in ecash instead of Lightning. NIP-87 is how Cashu mints and Fedimints announce themselves so wallets can find them. NIP-A3 defines `payto:` payment targets, a way to publish "pay me here" without tying the protocol to one rail.

NIP-69 is peer-to-peer order events: offers to buy or sell bitcoin (and similar) that a coordinator or a counterparty can take. It is closer to a marketplace than to a zap, but it lives here because the point of the event is a trade, not a listing on a wall.

**In this chapter**

- NIP-57 — Lightning zaps
- NIP-75 — Zap goals
- NIP-47 — Nostr Wallet Connect
- NIP-60 — Cashu wallet
- NIP-61 — Nutzaps
- NIP-87 — Cashu and Fedimint discoverability
- NIP-A3 — `payto:` payment targets
- NIP-69 — Peer-to-peer order events
