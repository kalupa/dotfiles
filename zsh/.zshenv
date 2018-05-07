#!/usr/local/bin/zsh

# echo "loading zshenv"

PATH="$HOME/.local/bin:$HOME/.cabal/bin:$PATH"
PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

PATH="$PATH:./.bundle/bin" # danger!

PATH="$PATH:$HOME/bin:./bin"
PATH="$PATH:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin"
PATH="$PATH:/usr/local/opt/go/libexec/bin"

PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"
  ssh-add
fi

if [ -z "$EMACS" ]; then
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

export TERMINFO="$HOME/.terminfo"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# rbenv configuation
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  eval "$(rbenv init -)"
  PATH="${RBENV_ROOT}/bin:${PATH}"
fi

export GOPATH="${HOME}/gocode"
PATH="$PATH:$GOPATH/bin"

export ANSIBLE_NOCOWS=1 # NO. JUST NO.

# added by travis gem
[ -f /Users/paul/.travis/travis.sh ] && source /Users/paul/.travis/travis.sh

source "$HOME/.zshenv_local"

export PATH
