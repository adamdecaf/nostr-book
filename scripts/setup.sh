#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [ -d 'nips' ];
then
    echo "Updating nostr-protocol/nips"
    git -C nips pull origin master
else
    echo "Pulling nostr-protocol/nips"
    git clone https://github.com/nostr-protocol/nips.git
fi

{
    echo "# Source snapshot"
    echo ""
    echo "This book was built from the following commit of [nostr-protocol/nips](https://github.com/nostr-protocol/nips). If something here disagrees with upstream, upstream wins."
    echo ""
    echo '```'
    git -C nips log -n1
    echo '```'
} > include/git.md
