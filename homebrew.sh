#!/bin/bash

if ! hash brew 2>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/cask

brew update

brew install macvim
brew install git
brew install wget
brew install node
brew install postgresql
brew install php56
brew install php56-pdo-pgsql
brew install python3
brew install gnupg

brew cask install google-chrome
brew cask install google-drive
brew cask install firefox
brew cask install shiftit
brew cask install flux
brew cask install limechat
brew cask install intellij-idea
brew cask install keepassx
brew cask install caffeine

brew upgrade
