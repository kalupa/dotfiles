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

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  eval "$(pyenv init -)"
  PATH="$(pyenv root)/shims:$PATH"
  export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
fi

# rbenv configuation
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  eval "$(rbenv init -)"
  PATH="${RBENV_ROOT}/bin:${PATH}"
fi

export GOPATH="${HOME}/gocode"

export ANSIBLE_NOCOWS=1 # NO. JUST NO.

source "$HOME/.zshenv_local"

export PATH
