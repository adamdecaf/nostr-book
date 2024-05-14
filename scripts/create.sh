#!/bin/bash

inputs=(
    include/intro.md

    include/01-overview.md
    nips/01.md # Basic protocol flow description
    # TODO: explain metadata more

    include/02-communication.md
    nips/10.md # Conventions for clients' use of e and p tags in text events
    nips/14.md # Subject tag in text events
    nips/23.md # Long-form Content
    nips/24.md # Extra metadata fields and tags
    nips/17.md # Private Direct Messages
    nips/04.md # Encrypted Direct Message --- unrecommended: deprecated in favor of NIP-17
    nips/40.md # Expiration Timestamp
    nips/09.md # Event Deletion
    nips/92.md # Media Attachments


    include/03-social.md
    nips/02.md # Follow List
    nips/05.md # Mapping Nostr keys to DNS-based internet identifiers
    nips/25.md # Reactions
    nips/30.md # Custom Emoji
    nips/18.md # Reposts
    nips/27.md # Text Note References
    nips/08.md # Handling Mentions --- unrecommended: deprecated in favor of NIP-17
    nips/38.md # User Statuses
    nips/58.md # Badges
    nips/39.md # External Identities in Profiles


    include/04-groups.md
    nips/28.md # Public Chat
    nips/29.md # Relay-based Groups


    include/05-moderation.md
    nips/32.md # Labeling
    nips/51.md # Lists
    nips/56.md # Reporting
    nips/36.md # Sensitive Content
    nips/72.md # Moderated Communities
    nips/13.md # Proof of Work


    include/06-relays.md
    nips/11.md # Relay Information Document
    nips/42.md # Authentication of clients to relays
    nips/50.md # Search Capability
    nips/45.md # Counting results
    nips/65.md # Relay List Metadata
    nips/48.md # Proxy Tags


    include/07-clients.md
    nips/21.md # nostr: URI scheme
    nips/19.md # bech32-encoded entities
    nips/03.md # OpenTimestamps Attestations for Events


    include/08-payments.md
    nips/57.md # Lightning Zaps
    nips/47.md # Wallet Connect
    nips/75.md # Zap Goals


    include/09-third-parties.md
    nips/26.md # Delegated Event Signing
    nips/59.md # Gift Wrap
    nips/46.md # Nostr Connect
    nips/90.md # Data Vending Machines


    include/10-application-features.md
    nips/52.md # Calendar Events
    nips/53.md # Live Activities
    nips/84.md # Highlights
    nips/15.md # Nostr Marketplace (for resilient marketplaces)
    nips/99.md # Classified Listings
    nips/54.md # Wiki
    nips/34.md # git stuff
    nips/94.md # File Metadata
    nips/96.md # HTTP File Storage Integration
    nips/78.md # Application-specific data


    include/11-security.md
    nips/06.md # Basic key derivation from mnemonic seed phrase
    nips/49.md # Private Key Encryption
    # nips/44.md # Versioned Encryption # TODO: escape sequence
    nips/98.md # HTTP Auth


    include/12-developers.md
    nips/07.md # window.nostr capability for web browsers
    nips/31.md # Dealing with Unknown Events
    nips/89.md # Recommended Application Handlers

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
           --toc --toc-depth 2 \
           --pdf-engine=xelatex \
           --columns=72 --wrap=auto \
           --listings -H listings-settings.tex \
           -V fontsize="10pt" \
           -V mainfont="Palatino" \
           -V monofont="Monaco" \
           -V geometry:margin="0.75in" \
           -s -o nostr-book.pdf \
           "${chapters[@]}"

    # -V mainfontfallback="Apple Color Emoji"
    # -V monofontfallback="Apple Color Emoji"
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
