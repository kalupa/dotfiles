#!/usr/local/bin/zsh

# echo 'loading zshrc'

export TERMINFO="$HOME/.terminfo"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

[[ ! -d ~/.antigen.git ]] && git clone https://github.com/zsh-users/antigen.git ~/.antigen.git

source ~/antigen/antigen.zsh

# antigen update
# antigen selfupdate
# antigen bundle unixorn/autoupdate-antigen.zshplugin

antigen bundle djui/alias-tips
antigen bundle KevinBongart/rake-fast

antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen use oh-my-zsh
# antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

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

exists ()
{
    command -v "$1" >/dev/null 2>&1
}

antigen bundle autojump
antigen bundle bundler
antigen bundle cabal
antigen bundle colorize
antigen bundle docker
antigen bundle emacs
antigen bundle git
antigen bundle git-extras
antigen bundle gitignore
antigen bundle gnu-utils
antigen bundle history-substring-search
antigen bundle kubectl
antigen bundle lein
# antigen bundle maven
antigen bundle mosh
antigen bundle node
antigen bundle npm
# antigen bundle per-directory-history
# antigen bundle pip
antigen bundle python

if exists rails; then
  antigen bundle gem
  antigen bundle rails
  antigen bundle rbenv
  antigen bundle ruby
fi

antigen bundle safe-paste
antigen bundle ssh-agent
# antigen bundle stack
# antigen bundle virtualenv
# antigen bundle virtualenvwrapper
antigen bundle zsh_reload

zstyle :omz:plugins:ssh-agent agent-forwarding on

# quick and dirty web server
if exists python; then
    function psy(){
        python -m SimpleHTTPServer 8900 && open "http://localhost:8900"
    }
fi

antigen apply

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

autoload -U promptinit; promptinit;
PURE_GIT_PULL=0
prompt pure


unalias gl
alias grbm="git fetch; git rebase origin/master"

source "$HOME/.zshrc_local"
