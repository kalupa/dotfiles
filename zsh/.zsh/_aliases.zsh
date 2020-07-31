#!/usr/local/bin/zsh

alias ls='gls --color'
alias lt='ls --tree'

alias grbm="git fetch; git rebase origin/master"
alias gpl="git pull"
alias gcrb="git symbolic-ref --short HEAD"

if ! type gtar >/dev/null; then
	alias tar="$(which gtar)"
fi
