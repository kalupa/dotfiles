# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/usr/local/bin/zsh

# Antigen
# [[ ! -d $HOME/.antigen.git ]] && git clone https://github.com/zsh-users/antigen.git $HOME/.antigen.git
export ANTIGEN_COMPDUMP=${HOME}/.zcompdump
source $HOME/.antigen.git/antigen.zsh
antigen init $HOME/.antigenrc

zstyle :omz:plugins:ssh-agent agent-forwarding on

source "$HOME/.zsh/_aliases.zsh"

# nvm for node
source "$HOME/.zsh/load-nvmrc.zsh"


source "/usr/local/share/zsh/site-functions"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)"

if [ -z "$(command -v rbenv)" ]; then
	eval "$(rbenv init -)"
fi

if [ -z "$(command -v direnv)" ]; then
	eval "$(direnv hook zsh)" # local env variables (want PATH different for projects)
fi

source "$HOME/.zshrc_local"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
