#!/usr/local/bin/zsh

export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
source /usr/local/bin/virtualenvwrapper.sh

# echo 'loading zshrc'

[[ ! -d $HOME/.antigen.git ]] && git clone https://github.com/zsh-users/antigen.git $HOME/.antigen.git
source $HOME/antigen/antigen.zsh
antigen init $HOME/.antigenrc

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

# pure prompt comes from antigen loading
autoload -U promptinit; promptinit;
PURE_GIT_PULL=0
prompt pure

unalias gl
alias grbm="git fetch; git rebase origin/master"
if exists gtar; then
  alias tar="$(which gtar)"
fi


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/.zshrc_local"
