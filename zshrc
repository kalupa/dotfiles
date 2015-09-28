#!/usr/local/bin/zsh

EDITOR="emacsclient -t"
TERM="xterm-256color"

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
PATH=$PATH:$HOME/bin:./bin:$HOME/Library/Haskell/bin:

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

#gulp
if [ -f "/usr/local/bin/gulp" ]; then
  eval "$(gulp --completion=zsh)"
fi

source "$HOME/.zshrc_local"

export PATH

if [ -f "/usr/local/heroku/bin" ]; then
  ### Added by the Heroku Toolbelt
  export PATH="/usr/local/heroku/bin:$PATH"
fi

