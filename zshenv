#!/usr/local/bin/zsh

# echo "loading zshenv"

# export EDITOR=~/bin/emc
# export TERM="eterm-color"

export TERMINFO="$HOME/.terminfo"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

PATH="$HOME/.cabal/bin" # cabal *really* likes to be first
PATH="$PATH:./.bundle/bin" # danger!
PATH="$PATH:$HOME/bin:./bin:$HOME/.local/bin"
PATH="$PATH:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin"
PATH="$PATH:`yarn global bin`"
# PATH=$PATH:$HOME/Library/Haskell/bin:

# rbenv configuation
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  eval "$(rbenv init -)"
  PATH="${RBENV_ROOT}/bin:${PATH}"
fi

export PATH

# homebrew related configs
if [ -f "/usr/local/bin/brew" ]; then
    BREW_PREFIX=$(brew --prefix)
    # here for now since I'm only really using python stuff on the mac
    export PYTHONPATH=$BREW_PREFIX/lib/python2.7/site-packages
fi

# export GITHUB_SSH_PRIVATE_KEY_FILE="$HOME/.ssh/id_rsa"
# export GITHUB_SSH_PUBLIC_KEY_FILE="$HOME/.ssh/id_rsa.pub"

export GOPATH="${HOME}/gocode"

export ANSIBLE_NOCOWS=1 # NO. JUST NO.

source "$HOME/.zshenv_local"
