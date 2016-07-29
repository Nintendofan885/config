#!/usr/bin/env bash

source ./homebrew_utils.sh
ensure_homebrew_is_installed
brew update
ensure_installed bash

new_shell='/usr/local/bin/bash'
grep $new_shell /etc/shells >/dev/null || sudo bash -c "echo $new_shell >> /etc/shells"
chsh -s $new_shell
