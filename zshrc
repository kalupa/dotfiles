# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="../custom/themes/sunaku-dbln"

EDITOR=/usr/bin/vim

export ZSH ZSH_THEME PATH

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(rails3 git brew bundler osx github gem ssh-agent ec2 node npm pow powder heroku cloudapp ruby rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/bin:/usr/local/git/bin:~/bin:$HOME/Library/Haskell/bin:$HOME/.cljr/bin:$HOME/.rbenv/bin:

# [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# source /usr/local/Cellar/coreutils/8.12/aliases

# personally added aliases - inline for now
alias t='python ~/src/t/t.py --task-dir ~/Dropbox/tasks --list tasks'

. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}
function git(){hub "$@"}

# eval "$(rbenv init -)"
export ANT_OPTS="-Xms256m -Xmx1024m -XX:MaxPermSize=512m"

function kicknginx () {
  kill -HUP `cat /usr/local/var/run/nginx.pid`
  touch ./tmp/restart.txt
}

[[ -s "/Users/paul/.rvm/scripts/rvm" ]] && source "/Users/paul/.rvm/scripts/rvm"  # This loads RVM into a shell session.
