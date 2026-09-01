# nostr-book

The [Nostr Implementation Possibilities (NIPs)](https://github.com/nostr-protocol/nips), compiled into a readable book.

NIPs are the community's specs for how Nostr clients and relays interoperate. Upstream they live as numbered markdown files. This project leaves that text alone, groups related NIPs into chapters, and builds an ebook from the result.

The book is compiled by Adam Shannon. The NIPs are written by their original authors.

## Get the book

- Website: [adamdecaf.github.io/nostr-book](https://adamdecaf.github.io/nostr-book/)
- [ePUB](https://github.com/adamdecaf/nostr-book/raw/master/nostr-book.epub)
- [PDF](https://github.com/adamdecaf/nostr-book/raw/master/nostr-book.pdf)

## What's inside

Chapters, not NIP numbers:

1. Overview — NIP-01, the basic protocol
2. Communication — notes, articles, comments, media, DMs
3. Social — follows, identity, reactions, polls, bookmarks
4. Groups — public chat, relay-based groups, threads
5. Moderation — labels, lists, reports, proof of work
6. Relays — info documents, auth, discovery, sync
7. Clients — `nostr:` URIs, bech32 encodings
8. Payments — zaps, wallet connect, Cashu
9. Third Parties — gift wrap, remote signers
10. Application Features — calendars, live streams, files, git, and other kinds
11. Security — keys, encryption, HTTP auth, vanish
12. Developers — browser and Android signers, app handlers

Unrecommended NIPs stay in the book, marked as such in the chapter intros. You will still meet them in the wild.

## Contributing

Display, grouping, and wrapping-prose improvements are welcome.

Do **not** edit files under `nips/`. That tree is a clone of [nostr-protocol/nips](https://github.com/nostr-protocol/nips). If a NIP is wrong, unclear, or out of date, send the change upstream.

Editorial wrapping lives in `include/`. Reading order lives in `scripts/create.sh`.

## Development

You need [pandoc](https://github.com/jgm/pandoc/blob/main/INSTALL.md) and a LaTeX engine for PDF. On macOS:

```
brew install pandoc basictex
eval "$(/usr/libexec/path_helper)"
```

Clone this repo, then pull the NIPs and build:

```
make setup    # clones or updates nostr-protocol/nips into ./nips
make epub
make pdf
```

`make setup` also writes the upstream git commit into `include/git.md` so the book records which snapshot it was built from.

## License

The code that generates this book is public domain (see [LICENSE](LICENSE)). NIP content follows the license of [nostr-protocol/nips](https://github.com/nostr-protocol/nips) (also public domain).
