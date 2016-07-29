#!/usr/bin/env bash

packages=(
    # web dev
    node
    homebrew/php/php56
    php56-pdo-pgsql
    postgresql
    # misc tools
    coreutils
    macvim
    git
    git-review # used for gerrit
    wget
    gnupg
    python
    python3
    enchant # needed as dependency for scikit-learn
    aspell
    bash-completion # _get_comp_words_by_ref needs newer version than default
    redis
    android-platform-tools
    elixir
    vitorgalvao/tiny-scripts/cask-repair # used to update casks
    docker
    docker-machine
)

declare -A package_options=(['aspell']='--with-all-langs')

CASKROOM="/usr/local/Caskroom"
casks=(
    virtualbox # needed for docker
    shiftit # window snapping
    caffeine # disable automatic sleep with toggle
    limechat # irc client
    keepassx
    google-chrome
    google-drive
    firefox
    flux # screen temperature adjuster
    intellij-idea
    google-play-music-desktop-player
    skype
    filezilla
    qbittorrent
    vlc
    kodi
    steam
    airvpn
    libreoffice
)

source ./homebrew_utils.sh

################################################################

ensure_homebrew_is_installed

status_update "Updating homebrew"
brew update

status_update "Installing packages"
package_count=${#packages[@]}
for (( i=0; i<${package_count}; i++ ))
do
    ensure_installed "${packages[$i]}"
    echo -en "Processed $((i + 1))/${package_count}\r"
done
echo

status_update "Installing casks"
cask_count=${#casks[@]}
for (( i=0; i<${cask_count}; i++ ))
do
    ensure_cask_installed "${casks[$i]}"
    echo -en "Processed $((i + 1))/${cask_count}\r"
done
echo

status_update "Upgrading packages"
brew upgrade

status_update "Cleaning up packages"
brew cleanup

status_update "Cleaning up casks"
brew cask cleanup

cleanup_old_cask_versions

