# Groups

Feeds are one-to-many. Groups are many-to-many: a room, a community, a thread with a title. Nostr has tried a few shapes for this, and they are not all equal.

NIP-28 is the original public chat: channels created as events, with messages that live on ordinary relays. It is unrecommended. The spec is still here because plenty of old events and clients speak it, but new work should look at NIP-29 instead. NIP-29 puts the group on a relay that knows about membership, roles, and moderation. The relay is still replaceable, but it is allowed to be opinionated about who may post.

Two newer NIPs cover lighter rooms. NIP-C7 is a simple chat message (kind 9) meant to be shown as a stream, not a Twitter-style thread. Replies quote a parent rather than nesting forever. NIP-7D is a forum thread: a titled topic (kind 11) with NIP-22 comments as replies. If you are building a Discord-like space, start with NIP-29. If you want a campfire or a forum, C7 and 7D are the smaller tools.

**In this chapter**

- NIP-28 — Public chat (unrecommended; try NIP-29)
- NIP-29 — Relay-based groups
- NIP-C7 — Chats
- NIP-7D — Forum threads
