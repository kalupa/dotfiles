#!/usr/local/bin/zsh

source /usr/local/bin/virtualenvwrapper.sh

# echo 'loading zshrc'

[[ ! -d $HOME/.antigen.git ]] && git clone https://github.com/zsh-users/antigen.git $HOME/.antigen.git
source $HOME/antigen/antigen.zsh
antigen init $HOME/.antigenrc
zstyle :omz:plugins:ssh-agent agent-forwarding on
# pure prompt comes from antigen loading
autoload -U promptinit; promptinit;
PURE_GIT_PULL=0
prompt pure

# quick and dirty web server
if (( $+commands[python] )); then
    function psy(){
        python -m SimpleHTTPServer 8900 && open "http://localhost:8900"
    }
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

unalias gl
alias grbm="git fetch; git rebase origin/master"

if (( $+commands[gtar] )); then
  alias tar="$(which gtar)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

source "$HOME/.zshrc_local"
