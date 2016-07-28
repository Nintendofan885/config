#!/bin/bash

# Dock
/usr/libexec/PlistBuddy -c "Set :tilesize 46" $HOME/Library/Preferences/com.apple.dock.plist
/usr/libexec/PlistBuddy -c "Set :autohide 1" $HOME/Library/Preferences/com.apple.dock.plist
/usr/libexec/PlistBuddy -c "Set :magnification 1" $HOME/Library/Preferences/com.apple.dock.plist

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles YES

# Terminal defaults
/usr/libexec/PlistBuddy -c "Set :'Default Window Settings' Pro" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Startup Window Settings' Pro" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:shellExitAction 0" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:rowCount 40" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:columnCount 150" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:ShowActiveProcessArgumentsInTitle 1" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:ShowRepresentedURLPathInTitle 1" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:ShowTTYNameInTitle 0" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:ShowCommandKeyInTitle 0" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:ShowDimensionsInTitle 0" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:ShowActiveProcessInTitle 1" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:ShowShellCommandInTitle 0" $HOME/Library/Preferences/com.apple.Terminal.plist

# Add login items
for item in Caffeine Flux 'Google Drive' 'Google Play Music Desktop Player' ShiftIt; do
    ./add_login_item.scpt "$item" "/Applications/$item.app" true
done
