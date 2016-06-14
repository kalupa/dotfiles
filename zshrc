#!/usr/local/bin/zsh

#omyzsh
export ZSH=$HOME/.oh-my-zsh
export COMPLETION_WAITING_DOTS="true"
if [[ -n ${INSIDE_EMACS} ]]; then
    BULLETTRAIN_GIT_SHOW=false
fi
export ZSH_THEME="bullet-train"

plugins=(
    battery brew bower bundler
    cabal coffee colorize
    emacs
    gem git git-extras gitignore gnu-utils
    lein
    man mosh
    node npm
    osx
    pip python
    rake-fast rails rbenv ruby
    safe-paste ssh-agent stack
    thor # tmux
    virtualenv # virtualenvwrapper
    zsh_reload
)
export plugins
source "$ZSH/oh-my-zsh.sh"

zstyle :omz:plugins:ssh-agent agent-forwarding on

# homebrew related configs
if [ -f "/usr/local/bin/brew" ]; then
  BREW_PREFIX=$(brew --prefix)

  # quick jump
  #. "$( brew --prefix )/etc/profile.d/z.sh"
  [[ -s "$BREW_PREFIX/etc/profile.d/autojump.sh" ]] && . "$BREW_PREFIX/etc/profile.d/autojump.sh"

  # brew completions
  ZSHBREWPATH=$BREW_PREFIX/share/zsh/
  [ -f "$ZSHBREWPATH/_git" ] && . "$ZSHBREWPATH/_git"
  [ -f "$ZSHBREWPATH/_docker" ] && . "$ZSHBREWPATH/_docker"
fi

# python-related
# quick and dirty web server
function psy(){
  python -m SimpleHTTPServer 8900 && open "http://localhost:8900"
}

#gulp
if [ -f "/usr/local/bin/gulp" ]; then
  eval "$(gulp --completion=zsh)"
fi

source "$HOME/.zshrc_local"
