#!/bin/zsh
[[ ! -d ~/.antigen.git ]] && git clone https://github.com/zsh-users/antigen.git ~/.antigen.git

BULLETTRAIN_RUBY_SHOW=false
if [[ -n ${INSIDE_EMACS} ]]; then
    BULLETTRAIN_GIT_SHOW=false
fi

source ~/.antigen.git/antigen.zsh
antigen use oh-my-zsh

# macos specific
# Load OS specific bundles

if [[ `uname` == "Darwin" ]]; then
    # homebrew related configs
    if [ -f "/usr/local/bin/brew" ]; then
        BREW_PREFIX=$(brew --prefix)
    fi
    antigen bundle battery
    antigen bundle brew
    antigen bundle brew-cask
    # antigen bundle emacs # this activates emacsclient alias
    antigen bundle osx
elif [[ `uname` == "Linux" ]]; then
    antigen bundle debian
fi

antigen bundle autojump
antigen bundle bundler
antigen bundle cabal
antigen bundle colorize
antigen bundle docker
antigen bundle gem
antigen bundle git
antigen bundle git-extras
antigen bundle gitignore
antigen bundle gnu-utils
antigen bundle history-substring-search
antigen bundle lein
antigen bundle mosh
antigen bundle node
antigen bundle npm
antigen bundle per-directory-history
antigen bundle pip
antigen bundle python
antigen bundle rails
antigen bundle rbenv
antigen bundle ruby
antigen bundle safe-paste
antigen bundle ssh-agent
antigen bundle stack
antigen bundle virtualenv
antigen bundle virtualenvwrapper
antigen bundle zsh_reload
antigen bundle djui/alias-tips
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle KevinBongart/rake-fast
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle wbinglee/zsh-wakatime

antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
zstyle :omz:plugins:ssh-agent agent-forwarding on

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

antigen apply
unalias gl

function emc-start() {
    echo "Daemonizing ..."
    emacs --daemon &&
        echo "Starting GUI" &&
        emacsclient -n -c
}

function emc() {
    emacsclient -n $*
}

source "$HOME/.zshrc_local"
