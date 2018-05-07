#!/usr/local/bin/zsh

# quick and dirty web server
if exists python; then
	function psy() {
		python -m SimpleHTTPServer 8900 && open "http://localhost:8900"
	}
fi

unalias gl
alias grbm="git fetch; git rebase origin/master"
alias gpl="git pull"

if exists gtar; then
	alias tar="$(which gtar)"
fi