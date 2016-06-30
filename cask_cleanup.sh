#!/bin/bash

CASKROOM="/usr/local/Caskroom"
casks=$(brew cask list)

for cask in $casks; do
    echo "Cleaning up $cask"
    current_version=$(brew cask info $cask | head -n1 | cut -d' ' -f2)
    echo "  version: $current_version"
    for version in $(ls $CASKROOM/$cask); do
        if [ "$current_version" != "$version" ]; then
            echo "    rm -rf $CASKROOM/$cask/$version"
            rm -rf $CASKROOM/$cask/$version
        fi
    done
    echo
done
