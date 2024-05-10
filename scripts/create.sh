#!/bin/bash

inputs=(
    include/intro.md

    # TODO: Will need to add sections inbetween groups of NIPs

    nips/01.md   # Basic protocol flow description
    nips/02.md   # Follow List
    nips/03.md   # OpenTimestamps Attestations for Events
    nips/04.md   # Encrypted Direct Message --- unrecommended: deprecated in favor of NIP-17
    nips/05.md   # Mapping Nostr keys to DNS-based internet identifiers
    nips/06.md   # Basic key derivation from mnemonic seed phrase
    # nips/07.md # window.nostr capability for web browsers
    # nips/08.md # Handling Mentions --- unrecommended: deprecated in favor of NIP-17
    # nips/09.md # Event Deletion
    nips/10.md   # Conventions for clients' use of e and p tags in text events
    nips/11.md   # Relay Information Document
    nips/13.md   # Proof of Work
    # nips/14.md # Subject tag in text events
    # nips/15.md # Nostr Marketplace (for resilient marketplaces)
    # nips/17.md # Private Direct Messages
    # nips/18.md # Reposts
    nips/19.md   # bech32-encoded entities
    # nips/21.md # nostr: URI scheme
    # nips/23.md # Long-form Content
    # nips/24.md # Extra metadata fields and tags
    # nips/25.md # Reactions
    # nips/26.md # Delegated Event Signing
    # nips/27.md # Text Note References
    # nips/28.md # Public Chat
    nips/29.md   # Relay-based Groups
    # nips/30.md # Custom Emoji
    nips/31.md   # Dealing with Unknown Events
    # nips/32.md # Labeling
    nips/34.md   # git stuff
    # nips/36.md # Sensitive Content
    # nips/38.md # User Statuses
    # nips/39.md # External Identities in Profiles
    # nips/40.md # Expiration Timestamp
    nips/42.md   # Authentication of clients to relays
    # nips/44.md # Versioned Encryption
    # nips/45.md # Counting results
    nips/46.md   # Nostr Connect
    # nips/47.md # Wallet Connect
    # nips/48.md # Proxy Tags
    nips/49.md   # Private Key Encryption
    # nips/50.md # Search Capability
    # nips/51.md # Lists
    nips/52.md   # Calendar Events
    nips/53.md   # Live Activities
    nips/54.md   # Wiki
    # nips/56.md # Reporting
    # nips/57.md # Lightning Zaps
    # nips/58.md # Badges
    # nips/59.md # Gift Wrap
    # nips/65.md # Relay List Metadata
    # nips/72.md # Moderated Communities
    # nips/75.md # Zap Goals
    # nips/78.md # Application-specific data
    # nips/84.md # Highlights
    # nips/89.md # Recommended Application Handlers
    # nips/90.md # Data Vending Machines
    # nips/92.md # Media Attachments
    nips/94.md   # File Metadata
    # nips/96.md # HTTP File Storage Integration
    # nips/98.md # HTTP Auth
    # nips/99.md # Classified Listings

    include/conclusion.md
)

format=$1

chapters=()
for input in "${inputs[@]}"
do
    if [[ "$format" == "pdf" ]];
    then
        # The PDF engine needs page breaks inserted so each section is separated a bit more.
        chapters+=("include/pagebreak.md" "$input")
    else
        chapters+=("$input")
    fi
done

function create_epub() {
    # TODO(adam): Add epub flags
    # https://pandoc.org/MANUAL.html#option--epub-chapter-level
    pandoc --metadata-file=metadata.yml \
           --epub-metadata=./metadata-epub.yml \
           --highlight-style=monochrome \
           -s -o nostr-book.epub \
           "${chapters[@]}"
}

function create_pdf() {
    # TODO: needs "brew install basictex"
    # and   eval "$(/usr/libexec/path_helper)"

    pandoc --metadata-file=metadata.yml \
           --toc --toc-depth 3 \
           --pdf-engine=xelatex \
           --columns=72 --wrap=auto \
           --listings -H listings-settings.tex \
           -V fontsize="10pt" \
           -V mainfont="Palatino" \
           -V monofont="Monaco" \
           -V geometry:margin="0.75in" \
           -s -o nostr-book.pdf \
           "${chapters[@]}"
}

case "$format" in
    epub)
        echo "Building ePUB"
        create_epub
        ;;

    pdf)
        echo "Building PDF"
        create_pdf
        ;;

    *)
        echo "Unknown format $format"
        exit 1
        ;;
esac
