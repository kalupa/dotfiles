#!/usr/local/bin/zsh
export EDITOR=/usr/local/bin/vim

[ -f "/usr/local/bin/powerline-daemon" ] && powerline-daemon -q

#omyzsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sunaku-dbln"
COMPLETION_WAITING_DOTS="true"
export ZSH ZSH_THEME PATH EDITOR COMPLETION_WAITING_DOTS
plugins=(brew bundler coffee gem git git-extras gitignore node npm osx pip rake rails rbenv ruby ssh-agent)
export plugins
source "$ZSH/oh-my-zsh.sh"
zstyle :omz:plugins:ssh-agent agent-forwarding on

PATH=./.bundle/bin:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin
PATH=$PATH:$HOME/bin:./bin
PATH="$HOME/Library/Haskell/bin:$PATH"
PATH="$HOME/.jenv/bin:$PATH"
export PATH

# zsh online help
unalias run-help
autoload run-help
export HELPDIR=/usr/local/share/zsh/helpfiles

# quick jump
#. "$( brew --prefix )/etc/profile.d/z.sh"
[[ -s "$(brew --prefix)/etc/profile.d/autojump.sh" ]] && . "$(brew --prefix)/etc/profile.d/autojump.sh"
#git
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gl='git pull --prune'

# ruby performance enhancements
RUBY_GC_HEAP_INIT_SLOTS=1000000
RUBY_HEAP_SLOTS_INCREMENT=1000000
RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
RUBY_GC_MALLOC_LIMIT=1000000000
RUBY_HEAP_FREE_MIN=500000
export RUBY_GC_HEAP_INIT_SLOTS RUBY_HEAP_FREE_MIN RUBY_GC_MALLOC_LIMIT RUBY_HEAP_SLOTS_GROWTH_FACTOR RUBY_HEAP_SLOTS_INCREMENT RUBY_HEAP_MIN_SLOTS

# rbenv configuation
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  eval "$(rbenv init -)"
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
[ -f "/usr/local/bin/virtualenvwrapper.sh" ] && . /usr/local/bin/virtualenvwrapper.sh
[ -f "$PYTHONPATH/powerline/bindings/zsh/powerline.zsh" ] && . "$PYTHONPATH/powerline/bindings/zsh/powerline.zsh"

function psy(){
  python -m SimpleHTTPServer 8900 && open "http://localhost:8900"
}

[ -f "$HOME/.awsenv.sh" ] && . "$HOME/.awsenv.sh"
[ -f "$HOME/.browserstackenv.sh" ] && . "$HOME/.browserstackenv.sh"

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && . /Users/paul/.travis/travis.sh

# java
eval "$(jenv init -)"
export JAVA_HOME="$(jenv javahome)"

#gulp
 eval "$(gulp --completion=zsh)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
