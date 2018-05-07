#!/usr/local/bin/zsh

# source /usr/local/bin/virtualenvwrapper.sh

# echo 'loading zshrc'

[[ ! -d $HOME/.antigen.git ]] && git clone https://github.com/zsh-users/antigen.git $HOME/.antigen.git
source $HOME/.antigen.git/antigen.zsh
antigen init $HOME/.antigenrc
zstyle :omz:plugins:ssh-agent agent-forwarding on

fpath+=('/home/paul/.nvm/versions/node/v8.11.1/lib/node_modules/pure-prompt/functions')

# pure prompt comes from antigen loading .zshenv or .zshrc
autoload -U promptinit
promptinit
PURE_GIT_PULL=0
prompt pure

source "zsh/_aliases.zsh"

# TODO test for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

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

#if exists stack; then
#  autoload -U +X compinit && compinit
#  autoload -U +X bashcompinit && bashcompinit
#  eval "$(stack --bash-completion-script stack)"
#fi

source "$HOME/.zshrc_local"