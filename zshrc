ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sunaku-dbln"

EDITOR=/usr/local/bin/vim

export ZSH ZSH_THEME PATH EDITOR

plugins=(ruby rails3 rake gem brew osx git github ssh-agent node npm heroku cloudapp)

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#/Users/paul/.rvm/gems/ruby-1.9.3-p194/bin:/Users/paul/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/paul/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/paul/.rvm/bin:
export PATH=/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin:~/bin:$HOME/Library/Haskell/bin:$HOME/.cljr/bin:

. `brew --prefix`/etc/profile.d/z.sh

function precmd () {
  z --add "$(pwd -P)"
}
function git(){hub "$@"}

export ANT_OPTS="-Xms256m -Xmx1024m -XX:MaxPermSize=512m"

# dirty little alias to restart nginx and passenger
function kicknginx () {
  #kill -HUP `cat /usr/local/var/run/nginx.pid`
  launchctl stop homebrew.mxcl.nginx
  launchctl start homebrew.mxcl.nginx
  touch ./tmp/restart.txt
}

function staging-console () {
  ssh woople_staging -t "cd /data/Woople/current/ && RAILS_ENV=staging bundle exec rails c "
}
function utility-console () {
  ssh utility -t "cd /data/Woople/current/ && RAILS_ENV=production bundle exec rails c "
}
function woople-console () {
  ssh woople -t "cd /data/Woople/current/ && RAILS_ENV=production bundle exec rails c "
}

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator # load tmuxinator project scripts

# ruby performance enhancements
RUBY_HEAP_MIN_SLOTS=1000000
RUBY_HEAP_SLOTS_INCREMENT=1000000
RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
RUBY_GC_MALLOC_LIMIT=1000000000
RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_FREE_MIN RUBY_GC_MALLOC_LIMIT RUBY_HEAP_SLOTS_GROWTH_FACTOR RUBY_HEAP_SLOTS_INCREMENT RUBY_HEAP_MIN_SLOTS

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export WOOPLE_SECRET='123456789'
export WOOPLE_KEY='woople'

source /Users/paul/.rvm/scripts/rvm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
