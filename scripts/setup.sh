#!/bin/bash

if [ -d 'nips' ];
then
    echo "Updating nostr-protocol/nips"
    cd nips
    git pull origin master
    cd - 2>&1 > /dev/null
else
    echo "Pulling nostr-protocol/nips"
    git clone https://github.com/nostr-protocol/nips.git
fi

# Include the latest git commit in the book
echo "## Git Commit" > ./include/git.md
echo "To provide readers with the most up-to-date information, this page showcases the latest git commit from the nostr-protocol/nips repository on GitHub. This commit log offers a snapshot of the most recent changes, updates, and enhancements made to the Nostr Improvement Proposals (NIPs). By incorporating this information, readers can gain insight into the ongoing development and evolution of the Nostr protocol, ensuring they are informed about the latest contributions and modifications from the community. This inclusion underscores the dynamic nature of the project and highlights the collaborative efforts driving its progress." >> ./include/git.md
echo "" >> ./include/git.md

cd nips/
commit=$(git log -n1)
echo '```shell' >> ../include/git.md
echo "$commit" >> ../include/git.md
echo '```' >> ../include/git.md
cd - 2>&1 > /dev/null
