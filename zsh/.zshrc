#!/usr/local/bin/zsh

# Antigen
# [[ ! -d $HOME/.antigen.git ]] && git clone https://github.com/zsh-users/antigen.git $HOME/.antigen.git
export ANTIGEN_COMPDUMP=${HOME}/.zcompdump
source $HOME/.antigen.git/antigen.zsh
antigen init $HOME/.antigenrc

zstyle :omz:plugins:ssh-agent agent-forwarding on

source "$HOME/.zsh/_aliases.zsh"

# asdf can replace nvm, rbenv
# source "$(brew --prefix asdf)/asdf.sh"

# nvm for node
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

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)"
alias ls="ls -G --color"

if [ -z "$(command -v rbenv)" ]; then
	eval "$(rbenv init -)"
fi

if [ -z "$(command -v direnv)" ]; then
	eval "$(direnv hook zsh)" # local env variables (want PATH different for projects)
fi

source "$HOME/.zshrc_local"
