#!/usr/local/bin/zsh

# echo "loading zshenv"

# export EDITOR=~/bin/emc
# export TERM="eterm-color"

PATH="$HOME/.cabal/bin" # cabal *really* likes to be first
PATH="$PATH:./.bundle/bin" # danger!
PATH="$PATH:$HOME/bin:./bin:$HOME/.local/bin"
PATH="$PATH:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin"

# PATH="$PATH:`yarn global bin`"
# PATH=$PATH:$HOME/Library/Haskell/bin:

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"
  ssh-add
fi

if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi

# added by travis gem
[ -f /Users/paul/.travis/travis.sh ] && source /Users/paul/.travis/travis.sh

if [ -z "$EMACS" ]; then
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

# if exists stack; then
#   autoload -U +X compinit && compinit
#   autoload -U +X bashcompinit && bashcompinit
#   eval "$(stack --bash-completion-script stack)"
# fi

export TERMINFO="$HOME/.terminfo"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

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
