#!/bin/bash

if ! hash brew 2>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/cask

brew update

# Web dev
brew install node
brew install php56
brew install php56-pdo-pgsql
brew install postgresql

# Misc tools
brew install macvim
brew install git
brew install git-review # Used for gerrit
brew install wget
brew install gnupg
brew install python3

brew cask install shiftit # Window snapping
brew cask install caffeine # Disable automatic sleep
brew cask install limechat # IRC client
brew cask install keepassx # KeePass tool
brew cask install google-chrome
brew cask install google-drive
brew cask install firefox
brew cask install flux # Screen temperature adjuster
brew cask install intellij-idea

brew upgrade
