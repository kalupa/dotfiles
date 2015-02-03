#!/usr/local/bin/zsh

powerline-daemon -q

export EDITOR=/usr/local/bin/vim

#omyzsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sunaku-dbln"
COMPLETION_WAITING_DOTS="true"
export ZSH ZSH_THEME PATH EDITOR COMPLETION_WAITING_DOTS
plugins=(brew bundler coffee gem git git-extras gitignore node npm osx pip rake rails rbenv ruby ssh-agent)
export plugins
source "$ZSH/oh-my-zsh.sh"
zstyle :omz:plugins:ssh-agent agent-forwarding on

PATH=./.bundle/bin:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin
PATH=$PATH:$HOME/bin:./bin
PATH="$HOME/Library/Haskell/bin:$PATH"
PATH="$HOME/.jenv/bin:$PATH"
export PATH

# zsh online help
unalias run-help
autoload run-help
export HELPDIR=/usr/local/share/zsh/helpfiles

# z quick cd
. "$( brew --prefix )/etc/profile.d/z.sh"

#git
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gl='git pull --prune'

# ruby performance enhancements
RUBY_GC_HEAP_INIT_SLOTS=1000000
RUBY_HEAP_SLOTS_INCREMENT=1000000
RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
RUBY_GC_MALLOC_LIMIT=1000000000
RUBY_HEAP_FREE_MIN=500000
export RUBY_GC_HEAP_INIT_SLOTS RUBY_HEAP_FREE_MIN RUBY_GC_MALLOC_LIMIT RUBY_HEAP_SLOTS_GROWTH_FACTOR RUBY_HEAP_SLOTS_INCREMENT RUBY_HEAP_MIN_SLOTS

# rbenv configuation
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  eval "$(rbenv init -)"
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

. /usr/local/bin/virtualenvwrapper_lazy.sh
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

function psy(){
  python -m SimpleHTTPServer 8900 && open "http://localhost:8900"
}

#nvm setup
#[[ -s "${ HOME }/.nvm/nvm.sh" ]] && . "${ HOME }/.nvm/nvm.sh" # This loads NVM

# ImageMagick fun times
#export MAGICK_HOME="/usr/local/ImageMagick-6.8.7-7"
#export PATH="$MAGICK_HOME/bin:$PATH"
#export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"
#export DYLD_LIBRARY_PATH=/usr/local/ImageMagick-6.8.7-7/lib/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source "$HOME/.awsenv"
source "$HOME/.browserstackenv"

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source /Users/paul/.travis/travis.sh

# java
eval "$(jenv init -)"
export JAVA_HOME="$(jenv javahome)"
