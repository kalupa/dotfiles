#!/usr/local/bin/zsh

# /usr/local/bin/screenfetch -d '-host;-wm;-wmtheme;-de;-pkgs'

# homebrew gnu utils without the g prefix
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="$HOME/.local/bin:$HOME/.cabal/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

PATH="/usr/local/opt/curl/bin:$PATH" # use gnu curl
PATH="$PATH:./.bundle/bin"           # danger!

PATH="$PATH:$HOME/.emacs.d/bin"
PATH="$PATH:$HOME/bin:./bin"
# PATH="$PATH:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin"
PATH="$PATH:/usr/local/opt/go/libexec/bin"

PATH="$PATH:$NVM_DIR:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

# some better python bin-run pathing
if [ -z "$(command -v python)" ]; then
	USER_BASE_PATH=$(python -m site --user-base)
	PATH="$PATH:$USER_BASE_PATH/bin"
fi

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)"
	ssh-add
fi

# if [ -z "$EMACS" ]; then
# 	test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# fi

export TERMINFO="$HOME/.terminfo"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export LS_OPTIONS="--color"

# rbenv configuation
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
	PATH="${RBENV_ROOT}/bin:${PATH}"
fi

export GOPATH="${HOME}/gocode"
PATH="$PATH:$GOPATH/bin"
PATH="$PATH:/usr/local/opt/go/libexec/bin"

export ANSIBLE_NOCOWS=1     # NO. JUST NO.
export HUSKY_SKIP_INSTALL=1 # ALSO NO!

# added by travis gem
[ -f /Users/paul/.travis/travis.sh ] && source /Users/paul/.travis/travis.sh

source "$HOME/.zshenv_local"

export PATH

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --height 40% --reverse --preview 'bat --color \"always\"' {}"

export DOTFILES="$HOME/dotfiles"

export EDITOR="te"
export VISUAL="emacs"
export ALTERNATE_EDITOR=""
export CLICOLOR=true
