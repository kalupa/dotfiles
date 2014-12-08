EDITOR=/usr/local/bin/vim
#omyzsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sunaku-dbln"
export ZSH ZSH_THEME PATH EDITOR
plugins=(brew bundler coffee gem git git-extras gitignore node npm osx pip rake rails rbenv ruby ssh-agent tmuxinator)
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh
zstyle :omz:plugins:ssh-agent agent-forwarding on

export PATH=./.bundle/bin:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin
export PATH=$PATH:$HOME/bin:./bin

# use vim bindings in shell
#bindkey -v

#Postgres
#export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH

. `brew --prefix`/etc/profile.d/z.sh
# function git(){hub "$@"}

#git
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gl='git pull --prune'
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator # load tmuxinator project scripts

# ruby performance enhancements
RUBY_GC_HEAP_INIT_SLOTS=1000000
RUBY_HEAP_SLOTS_INCREMENT=1000000
RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
RUBY_GC_MALLOC_LIMIT=1000000000
RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_FREE_MIN RUBY_GC_MALLOC_LIMIT RUBY_HEAP_SLOTS_GROWTH_FACTOR RUBY_HEAP_SLOTS_INCREMENT RUBY_HEAP_MIN_SLOTS

# rbenv configuation
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  eval "$(rbenv init -)"
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

function psy(){python -m SimpleHTTPServer 8900 && open "http://localhost:8900"}

#nvm setup
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

# ImageMagick fun times
export MAGICK_HOME="/usr/local/ImageMagick-6.8.7-7"
export PATH="$MAGICK_HOME/bin:$PATH"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# java
#export JAVA_HOME=`/usr/libexec/java_home`

source $HOME/.awsenv
source $HOME/.browserstackenv

# added by travis gem
[ -f /Users/paul/.travis/travis.sh ] && source /Users/paul/.travis/travis.sh

source /usr/local/bin/virtualenvwrapper.sh

# zsh online help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles
export DYLD_LIBRARY_PATH=/usr/local/ImageMagick-6.8.7-7/lib/
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
