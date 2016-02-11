alias ll='ls -laG'
complete -o default -o nospace -W"$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d" " -f2)" scp sftp ssh
complete -o default -o nospace -W"$(find $HOME/.virtualenvs -name "activate")" source

export PS1="\w\$ "

export HOMEBREW_GITHUB_API_TOKEN=thishasbeensanitized
