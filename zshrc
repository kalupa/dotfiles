ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="../custom/themes/sunaku-dbln"

EDITOR=/usr/bin/vim

export ZSH ZSH_THEME PATH

plugins=(rails3 git brew bundler osx github gem ssh-agent ec2 node npm pow powder heroku cloudapp ruby rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/bin:/usr/local/git/bin:~/bin:$HOME/Library/Haskell/bin:$HOME/.cljr/bin:$HOME/.rbenv/bin:

# source /usr/local/Cellar/coreutils/8.12/aliases

. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}
function git(){hub "$@"}

export ANT_OPTS="-Xms256m -Xmx1024m -XX:MaxPermSize=512m"

# dirty little alias to restart nginx and passenger
function kicknginx () {
  kill -HUP `cat /usr/local/var/run/nginx.pid`
  touch ./tmp/restart.txt
}

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm  # This loads RVM into a shell session.

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator # load tmuxinator project scripts
