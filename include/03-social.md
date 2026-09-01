# Social

A social network on Nostr is just events about people. NIP-02 is the follow list: a kind 3 event that says who you want to hear from. Profiles themselves live in NIP-01 as kind 0, but two NIPs make those profiles easier to find in the wider world. NIP-05 maps a key to a DNS name like `ada@example.com`. NIP-39 links a profile to accounts on other platforms.

Once you can find people, you need ways to respond. NIP-25 is reactions — the protocol's like, emoji, or downvote. Custom emoji (NIP-30) let a community bring its own stickers. Reposts (NIP-18) copy or quote someone else's event into your own feed. NIP-27 is how notes mention other notes, profiles, and relays with `nostr:` links. The older mention syntax in NIP-08 is unrecommended; NIP-27 replaced it.

The rest of the chapter is social context around the feed. User statuses (NIP-38) are a short "what I'm doing" line. Badges (NIP-58) are awards one key gives another. Trusted assertions (NIP-85) let a third party say something about a user or an event — useful for reputation without putting a corporation in the middle. Polls (NIP-88) are a first-class way to ask a question and collect votes. Web bookmarks (NIP-B0) are how you save a URL onto Nostr, next to the people and notes you already follow.

**In this chapter**

- NIP-02 — Follow list
- NIP-05 — DNS identifiers for keys
- NIP-39 — Linking profiles to other platforms
- NIP-25 — Reactions
- NIP-30 — Custom emoji
- NIP-18 — Reposts
- NIP-27 — Text note references
- NIP-08 — Handling mentions (unrecommended; use NIP-27)
- NIP-38 — User statuses
- NIP-58 — Badges
- NIP-85 — Trusted assertions
- NIP-88 — Polls
- NIP-B0 — Web bookmarks
