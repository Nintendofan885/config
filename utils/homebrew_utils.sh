#!/usr/bin/env bash

CASKROOM="`brew --prefix`/Caskroom"
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
        brew install $@
    fi
}

function ensure_cask_installed {
    cask_info=$(brew cask info $1)
    echo "$cask_info" | grep 'Not installed' &>/dev/null
    is_not_installed=$?
    if [ $is_not_installed -eq 0 ]
    then
        brew cask install --force $1
    else
        manifest_version=$(echo "$cask_info" | head -n1 | cut -d' ' -f2)
        echo "$cask_info" | tail -n +2 | grep $manifest_version &>/dev/null
        is_manifest_version_present=$?
        if [ $is_manifest_version_present -ne 0 ]
        then
            brew cask install --force $1
        fi
    fi
}

function cleanup_old_cask_versions {
    status_update "Removing old cask versions"
    installed_casks=($(brew cask list))
    cask_count=${#installed_casks[@]}
    for (( i=0; i<${cask_count}; i++ ))
    do
        cask=${installed_casks[$i]}
        if (( $(ls -l $CASKROOM/$cask/.metadata | wc -l) > 2 ))
        then
            current_version=$(get_cask_manifest_version $cask)
            for version in $(ls $CASKROOM/$cask/.metadata)
            do
                if [ "$current_version" != "$version" ]
                then
                    echo "$CASKROOM/$cask/$version is replaced by $current_version"
                    rm -rf $CASKROOM/$cask/$version
                    rm -rf $CASKROOM/$cask/.metadata/$version
                fi
            done
        fi
        echo -en "Processed $((i + 1))/${cask_count}\r"
    done
    echo
}

function get_cask_installed_version {
    echo $(brew cask list $1 | grep "Staged content:" -A 1 | tail -n1 | cut -d' ' -f1 | sed "s|`echo $CASKROOM/$1/`||")
}

function get_cask_manifest_version {
    echo $(brew cask info $1 | head -n1 | cut -d' ' -f2)
}
