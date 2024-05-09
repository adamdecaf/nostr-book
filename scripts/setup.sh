#!/bin/bash

if [ -d 'nips' ];
then
    echo "Updating nostr-protocol/nips"
    cd nips
    git pull origin master
    cd -
else
    echo "Pulling nostr-protocol/nips"
    git clone https://github.com/nostr-protocol/nips.git
fi
