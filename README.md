# nostr-book

[NIPs](https://github.com/nostr-protocol/nips) consolidated and organized into a readable book format.

## Get the Book

nostr-book is available in [ePUB](https://github.com/adamdecaf/nostr-book/raw/master/nostr-book.epub) or [PDF](https://github.com/adamdecaf/nostr-book/raw/master/nostr-book.pdf).

## Contributing

Display or style improvements are welcome! The text is almost entirely pulled from the [NIPs repository](https://github.com/nostr-protocol/nips) and left unchanged. Improvements to a NIP should be made upstream.

## Development

You'll need to [install pandoc](https://github.com/jgm/pandoc/blob/main/INSTALL.md) and install basictex (`brew install basictex` on macOS).

To download the NIPs run `make setup`. Then you'll be able to generate the output formats.

```
make epub
```
```
make pdf
```

## License

The code to generate nostr-book is released in the Public Domain. Content from NIPs follows the license of [nostr-protocol/nips](https://github.com/nostr-protocol/nips).
