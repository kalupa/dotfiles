#!/usr/local/bin/zsh

#omyzsh
export ZSH=$HOME/.oh-my-zsh
export COMPLETION_WAITING_DOTS="true"
if [[ -n ${INSIDE_EMACS} ]]; then
    BULLETTRAIN_GIT_SHOW=false
fi
export ZSH_THEME="bullet-train"

plugins=(
    battery brew bundler
    cabal coffee colorize
    emacs
    gem git git-extras gitignore gnu-utils
    history-substring-search
    lein
    mosh
    node npm
    osx
    pip python
    rake-fast rails rbenv ruby
    safe-paste ssh-agent stack
    virtualenv virtualenvwrapper
    zsh_reload zsh-syntax-highlighting
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

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# python-related
# quick and dirty web server
function psy(){
  python -m SimpleHTTPServer 8900 && open "http://localhost:8900"
}

source "$HOME/.zshrc_local"
