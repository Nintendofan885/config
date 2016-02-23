#!/bin/bash

if ! hash brew 2>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

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

brew tap caskroom/cask

brew cask install google-chrome
brew cask install shiftit
brew cask install flux

brew upgrade
