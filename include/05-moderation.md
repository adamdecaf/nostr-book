# Moderation

Nostr does not have site-wide moderators. Anyone can post; anyone can ignore. That is the point, and it is also why clients need a shared language for "I don't want to see this" and "this is harmful." The NIPs in this chapter are that language. They never force a relay or a client to obey. They give honest software a way to label, list, report, and filter.

NIP-32 is labeling: a generic way to tag events or keys with a namespace and a value, so a community can mark spam, language, or topic without inventing a new kind each time. NIP-51 is lists — mutes, pins, bookmarks, relay sets, interest sets. A mute list is the closest thing Nostr has to a block button, and it lives on your key, not on a platform. NIP-56 is reporting: you tell relays and other clients that something is illegal, spam, impersonation, or abuse. NIP-36 marks sensitive content so clients can hide it behind a warning.

NIP-72 describes moderated communities with approval events. It is unrecommended; NIP-29 groups are the better place for that kind of room. NIP-13 is proof of work. It is not moderation in the human sense. It is a way to attach burned compute to an event so relays can demand a cost from spammers. Some people love it. Some relays ignore it. It belongs here because it is one of the few anti-spam tools that does not require a central bouncer.

**In this chapter**

- NIP-32 — Labeling
- NIP-51 — Lists
- NIP-56 — Reporting
- NIP-36 — Sensitive content
- NIP-72 — Moderated communities (unrecommended; try NIP-29)
- NIP-13 — Proof of work
