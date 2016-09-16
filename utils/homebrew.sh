#!/usr/bin/env bash

source "$(dirname $0)/homebrew_utils.sh"

packages=(
    # web dev
    node
    homebrew/php/php56
    php56-pdo-pgsql
    postgresql
    # misc tools
    coreutils
    pandoc
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
    nmap
#    homebrew/fuse/ext2fuse # used for mounting ext filesystems
)

declare -A package_options=(['aspell']='--with-all-langs')

casks=(
    shiftit # window snapping
    caffeine # disable automatic sleep with toggle
    limechat # irc client
    keepassx
    google-chrome
    google-drive
    firefox
    flux # screen temperature adjuster
    intellij-idea
    pycharm
    google-play-music-desktop-player
    skype
    filezilla
    qbittorrent
    vlc
    kodi
    steam
    airvpn
    libreoffice
    docker
    kitematic
    tunnelblick
    # karabiner is used to remap keys, but I'm using it to set the trackpad scroll
    #  direction to be opposite of the mouse with the following settings:
    #  - Karabiner Preferences > Change Key > Karabiner core settings >
    #    Exclude devices > Don't remap Apple's pointing devices
    #  - Karabiner Preferences > Change Key > Pointing Device >
    #    Reverse scrolling direction > Reverse Vertical Scrolling
    karabiner
#    osxfuse-beta # used for mounting different filesystems
)

################################################################

ensure_homebrew_is_installed

status_update "Updating homebrew"
brew update

status_update "Installing packages"
package_count=${#packages[@]}
for (( i=0; i<${package_count}; i++ ))
do
    ensure_installed "${packages[$i]}" ${package_options["${packages[$i]}"]}
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
brew cask cleanup --outdated

cleanup_old_cask_versions

