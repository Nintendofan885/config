#!/bin/bash

packages=(
    # web dev
    node
    php56
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
    bash-completion # _get_comp_words_by_ref needs newer version than default
    redis
    android-platform-tools
    elixir
    cask-repair # used to update casks
    # vitorgalvao/tiny-scripts/cask-repair # used to update casks
    docker
    docker-machine
)

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

installed_packages=($(brew list))
installed_casks=($(brew cask list))

function status_update {
    BLUE='\033[1;34m'
    WHITE='\033[1;97m'
    NC='\033[0m'
    echo -e "${BLUE}==> ${WHITE}${1}${NC}"
}

function contains_element {
    local element
    for element in "${@:2}"
    do
        if [[ "$element" == "$1" ]]
        then
            return 0
        fi
    done
    return 1
}

function ensure_homebrew_is_installed {
    status_update "Ensuring homebrew is installed"
    if ! hash brew 2>/dev/null
    then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Already installed"
    fi
}

function ensure_installed {
    if ! contains_element "$1" "${installed_packages[@]}"
    then
        brew install $1
    fi
}

function ensure_cask_installed {
    if ! contains_element "$1" "${installed_casks[@]}"
    then
        brew cask install $1
    fi
}

function cleanup_old_cask_versions {
    status_update "Removing old cask versions"
    installed_casks=($(brew cask list))
    cask_count=${#installed_casks[@]}
    for (( i=0; i<${cask_count}; i++ ))
    do
        cask=${installed_casks[$i]}
        current_version=$(brew cask info $cask | head -n1 | cut -d' ' -f2)
        for version in $(ls $CASKROOM/$cask)
        do
            if [ "$current_version" != "$version" ]
            then
                echo "$CASKROOM/$cask/$version is replaced by $current_version"
                rm -rf $CASKROOM/$cask/$version
            fi
        done
        echo -en "Processed $((i + 1))/${cask_count}\r"
    done
    echo
}

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
