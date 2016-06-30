#!/bin/bash

if ! hash brew 2>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Web dev
brew install node
brew install php56
brew install php56-pdo-pgsql
brew install postgresql

# Misc tools
brew install coreutils
brew install macvim
brew install git
brew install git-review # Used for gerrit
brew install wget
brew install gnupg
brew install python
brew install python3
brew install enchant # needed as dependency for scikit-learn
brew install bash-completion # _get_comp_words_by_ref needs newer version than default
brew install redis
brew install android-platform-tools
brew install elixir

# Docker
brew cask install virtualbox
brew install docker
brew install docker-machine

brew cask install shiftit # Window snapping
brew cask install caffeine # Disable automatic sleep
brew cask install limechat # IRC client
brew cask install keepassx # KeePass tool
brew cask install google-chrome
brew cask install google-drive
brew cask install firefox
brew cask install flux # Screen temperature adjuster
brew cask install intellij-idea
brew cask install google-play-music-desktop-player
brew cask install skype
brew cask install filezilla
brew cask install qbittorrent
brew cask install vlc
brew cask install kodi
brew cask install steam
brew cask install airvpn
brew cask install libreoffice

brew upgrade --cleanup
brew cask cleanup
