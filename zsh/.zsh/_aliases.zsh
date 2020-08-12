#!/usr/local/bin/zsh

# alias ls='gls --color'
alias ls="lsd"
alias lt='ls --tree'

alias npm='MARSHALL_DISABLE_SNYK=1 npq-hero'

alias grbm="git fetch; git rebase origin/master"
alias gpl="git pull"
alias gcrb="git symbolic-ref --short HEAD"

if ! type gtar >/dev/null; then
	alias tar="$(which gtar)"
fi
