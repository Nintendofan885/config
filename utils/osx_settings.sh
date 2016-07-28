#!/bin/bash

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles YES

# Terminal defaults
/usr/libexec/PlistBuddy -c "Set :'Default Window Settings' Pro" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Startup Window Settings' Pro" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:shellExitAction 0" $HOME/Library/Preferences/com.apple.Terminal.plist

# Add login items
for item in Caffeine Flux 'Google Drive' 'Google Play Music Desktop Player' ShiftIt; do
    ./add_login_item.scpt "$item" "/Applications/$item.app" true
done
