#!/usr/local/bin/zsh
EDITOR=/usr/local/bin/emacs
TERM="xterm-256color"
LANG="en_US.utf8"
export LANG TERM EDITOR

#omyzsh
ZSH=$HOME/.oh-my-zsh
COMPLETION_WAITING_DOTS="true"
ZSH_THEME="powerline"
POWERLINE_RIGHT_A="mixed"
# POWERLINE_RIGHT_A="exit-status"
# POWERLINE_RIGHT_B="none"
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_HIDE_HOST_NAME="true"
# POWERLINE_SHOW_GIT_ON_RIGHT="true"
export ZSH ZSH_THEME PATH EDITOR COMPLETION_WAITING_DOTS
export POWERLINE_HIDE_USER_NAME POWERLINE_SHOW_GIT_ON_RIGHT

plugins=(
    battery brew bower bundler
    coffee colorize
    emoji-clock
    gem git git-extras gitignore gnu-utils
    jira
    mosh
    node npm
    osx
    pip python
    rake rails rbenv ruby
    ssh-agent
    thor
    virtualenv virtualenvwrapper
)
export plugins
source "$ZSH/oh-my-zsh.sh"
zstyle :omz:plugins:ssh-agent agent-forwarding on

PATH=./.bundle/bin:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin
PATH=$PATH:$HOME/bin:./bin
PATH="$HOME/Library/Haskell/bin:$PATH"
PATH="$HOME/.jenv/bin:$PATH"
# PATH="$HOME/.pyenv/shims:$PATH"
export PATH

# zsh online help
if which run-help > /dev/null; then
    unalias run-help
    autoload run-help
    export HELPDIR=/usr/local/share/zsh/helpfiles
fi

# homebrew related configs
if [ -f "/usr/local/bin/brew" ]; then
  BREW_PREFIX=$(brew --prefix)

  # quick jump
  #. "$( brew --prefix )/etc/profile.d/z.sh"
  [[ -s "$BREW_PREFIX/etc/profile.d/autojump.sh" ]] && . "$BREW_PREFIX/etc/profile.d/autojump.sh"

  # brew completions
  ZSHBREWPATH=$BREW_PREFIX/share/zsh/
  [ -f "$ZSHBREWPATH/_git" ] && . "$ZSHBREWPATH/_git"
  #[ -f "$ZSHBREWPATH/_hub" ] && . "$ZSHBREWPATH/_hub"
  [ -f "$ZSHBREWPATH/_docker" ] && . "$ZSHBREWPATH/_docker"

  # here for now since I'm only really using python stuff on the mac
  export PYTHONPATH=$BREW_PREFIX/lib/python2.7/site-packages
fi

# python-related

# pyenv
# export PYENV_VERSION=2.7.10
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# if which powerline-daemon > /dev/null; then powerline-daemon -q; fi
# . "powerline.zsh"

[ -f "/usr/local/bin/virtualenvwrapper.sh" ] && . /usr/local/bin/virtualenvwrapper.sh
# [ -f "/usr/local/bin/powerline-daemon" ] && powerline-daemon -q
# [ -f "$PYTHONPATH/powerline/bindings/zsh/powerline.zsh" ] && . "$PYTHONPATH/powerline/bindings/zsh/powerline.zsh"

# quick and dirty web server
function psy(){
  python -m SimpleHTTPServer 8900 && open "http://localhost:8900"
}

# if which boot2docker > /dev/null; then eval "$(boot2docker shellinit)"; fi
# ruby performance enhancements
# RUBY_GC_HEAP_INIT_SLOTS=1000000
# RUBY_HEAP_SLOTS_INCREMENT=1000000
# RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# RUBY_GC_MALLOC_LIMIT=1000000000
# RUBY_HEAP_FREE_MIN=500000
# export RUBY_GC_HEAP_INIT_SLOTS RUBY_HEAP_FREE_MIN RUBY_GC_MALLOC_LIMIT RUBY_HEAP_SLOTS_GROWTH_FACTOR RUBY_HEAP_SLOTS_INCREMENT RUBY_HEAP_MIN_SLOTS

# rbenv configuation
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  eval "$(rbenv init -)"
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

# Amazon keys
[ -f "$HOME/.aws/env.sh" ] && . "$HOME/.aws/env.sh"

[ -f "$HOME/.browserstackenv.sh" ] && . "$HOME/.browserstackenv.sh"

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && . /Users/paul/.travis/travis.sh

export JAVA_HOME="$(jenv javahome)"
# java
if [ -f "$HOME/.browserstackenv.sh" ]; then
  eval "$(jenv init -)"
  export PUBLISHER_CONF="${HOME}/lp-publisher-conf.properties"
fi

# emacs gui cli
# if [ -f "/Applications/Emacs.app/contents/MacOS/Emacs" ]; then
#   export EDITOR="/usr/local/bin/emacsclient -c -n"
#   alias emc=$EDITOR
# fi

#gulp
if [ -f "/usr/local/bin/gulp" ]; then
  eval "$(gulp --completion=zsh)"
fi

if [ -f "/usr/local/heroku/bin" ]; then
  ### Added by the Heroku Toolbelt
  export PATH="/usr/local/heroku/bin:$PATH"
fi
