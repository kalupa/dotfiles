#!/usr/local/bin/zsh
[[ ! -d ~/.antigen.git ]] && \
    git clone https://github.com/zsh-users/antigen.git ~/.antigen.git

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
    antigen bundles <<EOBUNDLES
    battery
    brew
    brew-cask
    osx
    EOBUNDLES
elif [[ `uname` == "Linux" ]]; then
    antigen bundle debian
fi

antigen bundles <<EOBUNDLES
autojump
bundler
cabal
colorize
emacs
gem
git
git-extras
gitignore
gnu-utils
history-substring-search
lein
mosh
node
npm
per-directory-history
pip
python
rails
rbenv
ruby
safe-paste
ssh-agent
stack
virtualenv
virtualenvwrapper
zsh_reload
djui/alias-tips
unixorn/autoupdate-antigen.zshplugin
KevinBongart/rake-fast
zsh-users/zsh-completions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-autosuggestions
EOBUNDLES
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

source "$HOME/.zshrc_local"

antigen apply
