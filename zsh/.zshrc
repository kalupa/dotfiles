#!/usr/local/bin/zsh

# homebrew gnu utils without the g prefix
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# source /usr/local/bin/virtualenvwrapper.sh

# echo 'loading zshrc'

# Antigen
# [[ ! -d $HOME/.antigen.git ]] && git clone https://github.com/zsh-users/antigen.git $HOME/.antigen.git
export ANTIGEN_COMPDUMP=${HOME}/.zcompdump
source $HOME/.antigen.git/antigen.zsh
antigen init $HOME/.antigenrc

zstyle :omz:plugins:ssh-agent agent-forwarding on

source "$HOME/.zsh/_aliases.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# place this after nvm initialization!
source "$HOME/.zsh/load-nvmrc.zsh"

autoload -Uz +X compinit && compinit

fpath+="$HOME/.zsh_pure"
autoload -U promptinit
promptinit
PURE_GIT_PULL=0
prompt pure

# /bin/launchctl setenv PATH "$PATH"
source "/usr/local/share/zsh/site-functions"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ls="ls -G --color"
eval "$(direnv hook zsh)" # local env variables (want PATH different for projects)

source "$HOME/.zshrc_local"
