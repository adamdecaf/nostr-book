#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

inputs=(
    include/intro.md
    include/how-to-read.md
    include/git.md

    include/01-overview.md
    nips/01.md # Basic protocol flow description

    include/02-communication.md
    nips/10.md # Text Notes and Threads
    nips/14.md # Subject tag in text events
    nips/23.md # Long-form Content
    nips/24.md # Extra metadata fields and tags
    nips/22.md # Comment
    nips/68.md # Picture-first feeds
    nips/71.md # Video Events
    nips/A0.md # Voice Messages
    nips/92.md # Media Attachments Metadata
    nips/37.md # Draft Events
    nips/A4.md # Public Messages
    nips/17.md # Private Direct Messages
    nips/04.md # Encrypted Direct Message --- unrecommended
    nips/EE.md # E2EE Messaging using MLS --- unrecommended
    nips/40.md # Expiration Timestamp
    nips/09.md # Event Deletion Request

    include/03-social.md
    nips/02.md # Follow List
    nips/05.md # Mapping Nostr keys to DNS-based internet identifiers
    nips/39.md # Linking Profiles to Other Platforms
    nips/25.md # Reactions
    nips/30.md # Custom Emoji
    nips/18.md # Reposts
    nips/27.md # Text Note References
    nips/08.md # Handling Mentions --- unrecommended
    nips/38.md # User Statuses
    nips/58.md # Badges
    nips/85.md # Trusted Assertions
    nips/88.md # Polls
    nips/B0.md # Web Bookmarks

    include/04-groups.md
    nips/28.md # Public Chat --- unrecommended
    nips/29.md # Relay-based Groups
    nips/C7.md # Chats
    nips/7D.md # Forum Threads

    include/05-moderation.md
    nips/32.md # Labeling
    nips/51.md # Lists
    nips/56.md # Reporting
    nips/36.md # Sensitive Content
    nips/72.md # Moderated Communities --- unrecommended
    nips/13.md # Proof of Work

    include/06-relays.md
    nips/11.md # Relay Information Document
    nips/42.md # Authentication of clients to relays
    nips/70.md # Protected Events
    nips/43.md # Relay Access Metadata and Requests
    nips/65.md # Relay List Metadata
    nips/66.md # Relay Discovery and Liveness Monitoring
    nips/50.md # Search Capability
    nips/45.md # Counting results
    nips/67.md # EOSE Completeness Hint
    nips/77.md # Negentropy Syncing
    nips/86.md # Relay Management API
    nips/48.md # Bridged Events

    include/07-clients.md
    nips/21.md # nostr: URI scheme
    nips/19.md # bech32-encoded entities
    nips/03.md # OpenTimestamps Attestations --- unrecommended
    nips/BE.md # Nostr BLE Communications --- unrecommended

    include/08-payments.md
    nips/57.md # Lightning Zaps
    nips/75.md # Zap Goals
    nips/47.md # Nostr Wallet Connect
    nips/60.md # Cashu Wallet
    nips/61.md # Nutzaps
    nips/87.md # Cashu and Fedimint Discoverability
    nips/A3.md # payto: Payment Targets
    nips/69.md # Peer-to-peer Order events

    include/09-third-parties.md
    nips/59.md # Gift Wrap
    nips/46.md # Nostr Remote Signing
    nips/26.md # Delegated Event Signing --- unrecommended
    nips/90.md # Data Vending Machines --- unrecommended

    include/10-application-features.md
    nips/52.md # Calendar Events
    nips/53.md # Live Streaming and Spaces
    nips/F4.md # Podcasts
    nips/84.md # Highlights
    nips/54.md # Wiki
    nips/C0.md # Code Snippets
    nips/73.md # External Content IDs
    nips/34.md # git stuff
    nips/5A.md # Static Websites (nsites)
    nips/15.md # Nostr Marketplace --- unrecommended
    nips/99.md # Classified Listings
    nips/94.md # File Metadata
    nips/96.md # HTTP File Storage Integration --- unrecommended
    nips/B7.md # Blossom
    nips/35.md # Torrents
    nips/64.md # Chess (PGN)
    nips/CC.md # Geocaching
    nips/78.md # Application-specific data

    include/11-security.md
    nips/44.md # Encrypted Payloads (Versioned)
    nips/06.md # Basic key derivation from mnemonic --- unrecommended
    nips/49.md # Private Key Encryption (ncryptsec)
    nips/98.md # HTTP Auth
    nips/62.md # Request to Vanish

    include/12-developers.md
    nips/07.md # window.nostr capability for web browsers
    nips/55.md # Android Signer Application
    nips/89.md # Recommended Application Handlers
    nips/31.md # Dealing with Unknown Events --- unrecommended

    include/conclusion.md
)

format=${1:-}

missing=0
for input in "${inputs[@]}"
do
    if [[ ! -f "$input" ]]; then
        echo "error: missing $input" >&2
        missing=1
    fi
done
if [[ "$missing" -ne 0 ]]; then
    echo "Run 'make setup' first, or update the chapter list." >&2
    exit 1
fi

chapters=()
for input in "${inputs[@]}"
do
    if [[ "$format" == "pdf" && "$input" == include/* && "$input" != include/pagebreak.md ]]; then
        # Page-break at chapter wrappers only. Breaking before every spec
        # makes xelatex blow up on shipout and produces a jumpy book.
        chapters+=("include/pagebreak.md" "$input")
    else
        chapters+=("$input")
    fi
done

function create_epub() {
    pandoc --metadata-file=metadata.yml \
           --epub-metadata=./metadata-epub.yml \
           --syntax-highlighting=monochrome \
           --resource-path=.:nips \
           -s -o nostr-book.epub \
           "${chapters[@]}"
}

function create_pdf() {
    pandoc --metadata-file=metadata.yml \
           --pdf-engine=xelatex \
           --wrap=none \
           -f markdown-strikeout-footnotes \
           --syntax-highlighting=none \
           --resource-path=.:nips \
           -V fontsize="10pt" \
           -V mainfont="Palatino" \
           -V monofont="Monaco" \
           -V mainfontfallback="Hiragino Mincho ProN,Apple Color Emoji" \
           -V monofontfallback="Menlo,Hiragino Sans,Apple Color Emoji" \
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
        echo "Unknown format ${format:-<none>}" >&2
        echo "usage: $0 epub|pdf" >&2
        exit 1
        ;;
esac
