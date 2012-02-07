ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="../custom/themes/sunaku-dbln"

EDITOR=/usr/bin/vim

export ZSH ZSH_THEME PATH

plugins=(ruby rvm rails3 rake gem brew osx git github ssh-agent node npm heroku cloudapp)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:/bin:/usr/local/git/bin:~/bin:$HOME/Library/Haskell/bin:$HOME/.cljr/bin:

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

# ruby performance enhancements
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
