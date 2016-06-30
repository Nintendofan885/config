alias ls='ls --color=auto'
alias ll='ls -la'
alias grep="`which grep` --color=always"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

complete -o default -o nospace -W"$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d" " -f2)" scp sftp ssh
complete -o default -o nospace -W"$(find $HOME/.virtualenvs -name "activate")" source

# docker machine completion and ps1
source /usr/local/opt/docker-machine/etc/bash_completion.d/docker-machine-prompt.bash
source /usr/local/opt/docker-machine/etc/bash_completion.d/docker-machine-wrapper.bash
source /usr/local/opt/docker-machine/etc/bash_completion.d/docker-machine.bash

export PS1="$(__docker_machine_ps1)\w\$ "
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

source ~/.github_tokens.sh
