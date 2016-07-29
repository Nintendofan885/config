#!/usr/bin/env bash

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
if ! contains_element "$(echo "$1" | rev | cut -d'/' -f1 | rev)" "${installed_packages[@]}"
    then
        brew install $1 ${package_options["$1"]}
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
        if (( $(ls -l $CASKROOM/$cask | wc -l) > 2 ))
        then
            current_version=$(brew cask info $cask | head -n1 | cut -d' ' -f2)
            for version in $(ls $CASKROOM/$cask)
            do
                if [ "$current_version" != "$version" ]
                then
                    echo "$CASKROOM/$cask/$version is replaced by $current_version"
                    rm -rf $CASKROOM/$cask/$version
                fi
            done
        fi
        echo -en "Processed $((i + 1))/${cask_count}\r"
    done
    echo
}
