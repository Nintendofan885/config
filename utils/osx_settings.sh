#!/usr/bin/env bash

./set_preferences.applescript >/dev/null

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

# Disable auto adjust screen brightness
/usr/libexec/PlistBuddy -c "Set :'Automatic Display Enabled' 0" /Library/Preferences/com.apple.iokit.AmbientLightSensor.plist

# Disable navigation with swipe gesture
defaults write 'Apple Global Domain' AppleEnableSwipeNavigateWithScrolls -integer 0

# Add login items
for item in Caffeine Flux 'Google Drive' 'Google Play Music Desktop Player' ShiftIt; do
    ./add_login_item.applescript "$item" "/Applications/$item.app" true
done
