#!/usr/local/bin/zsh

EDITOR=/usr/local/bin/emacs
TERM="xterm-256color"
# LC_CTYPE="en_US.utf8"
# LANG="en_US.utf8"
# export LC_ALL LC_CTYPE LANG TERM EDITOR

#omyzsh
ZSH=$HOME/.oh-my-zsh
COMPLETION_WAITING_DOTS="true"
ZSH_THEME="bullet-train"
export ZSH ZSH_THEME PATH EDITOR COMPLETION_WAITING_DOTS

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
[ -f "/usr/local/bin/virtualenvwrapper.sh" ] && . /usr/local/bin/virtualenvwrapper.sh
# quick and dirty web server
function psy(){
  python -m SimpleHTTPServer 8900 && open "http://localhost:8900"
}

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

export NVM_DIR="/Users/paul/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
