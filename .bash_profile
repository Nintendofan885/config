alias ls='ls --color=auto'
alias ll='ls -la'
alias grep="`which grep` --color=always"
alias homebrew_me_harder='~/git/config/utils/homebrew.sh'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

complete -o default -o nospace -W"$(grep "^Host" $HOME/.ssh/config | grep -v "[?*]" | cut -d" " -f2)" scp sftp ssh
complete -o default -o nospace -W"$(find $HOME/.virtualenvs -name "activate")" source

GIT_PS1_SHOWDIRTYSTATE=1 # unstaged (*), staged (+)
GIT_PS1_SHOWSTASHSTATE=1 # stashed ($)
GIT_PS1_SHOWUNTRACKEDFILES=1 # untracked (%)
GIT_PS1_SHOWUPSTREAM="auto" # behind (<), ahead (>), diverged (<>), no difference (=)

export PS1='$(__git_ps1 "(%s) ")\w\$ '

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

source ~/.github_tokens.sh
