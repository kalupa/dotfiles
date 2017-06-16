#!/usr/local/bin/zsh

# echo "loading zshenv"

# export EDITOR=~/bin/emc
export TERM="xterm-256color"
# export TERM="eterm-color"
export TERMINFO="$HOME/.terminfo"

PATH=./.bundle/bin:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin
PATH=$PATH:$HOME/bin:./bin:
PATH=$PATH:$HOME/.local/bin:
export PATH="$PATH:`yarn global bin`"
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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# iterm2_print_user_vars() {
#     iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
# }
# printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n "\(user.gitBranch)" | base64)

export ANSIBLE_NOCOWS=1 # NO. JUST NO.

source "$HOME/.zshenv_local"
