#!/bin/bash

# Accept xcode license
sudo xcodebuild -license

# View hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# Terminal defaults
defaults write com.apple.terminal "Default Window Settings" Pro
defaults write com.apple.terminal "Startup Window Settings" Pro
/usr/libexec/PlistBuddy -c "Set :'Window Settings':Pro:shellExitAction 0" $HOME/Library/Preferences/com.apple.Terminal.plist
