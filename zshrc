#!/usr/local/bin/zsh

# echo 'loading zshrc'

export TERMINFO="$HOME/.terminfo"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

[[ ! -d ~/.antigen.git ]] && git clone https://github.com/zsh-users/antigen.git ~/.antigen.git

source ~/antigen/antigen.zsh

antigen init .antigenrc

zstyle :omz:plugins:ssh-agent agent-forwarding on

# quick and dirty web server
if exists python; then
    function psy(){
        python -m SimpleHTTPServer 8900 && open "http://localhost:8900"
    }
fi


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

autoload -U promptinit; promptinit;
PURE_GIT_PULL=0
prompt pure


unalias gl
alias grbm="git fetch; git rebase origin/master"

source "$HOME/.zshrc_local"
