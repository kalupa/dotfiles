EDITOR=/usr/local/bin/vim
#omyzsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sunaku-dbln"
export ZSH ZSH_THEME PATH EDITOR
plugins=(brew bundler cloudapp coffee gem git git-extras github heroku node npm osx rake rails ruby ssh-agent pip)
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh

export PATH=./.bundle/bin:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin
export PATH=$PATH:$HOME/bin:./bin

#Postgres
#export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH

. `brew --prefix`/etc/profile.d/z.sh
# function git(){hub "$@"}

#[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator # load tmuxinator project scripts

# ruby performance enhancements
RUBY_HEAP_MIN_SLOTS=1000000
RUBY_HEAP_SLOTS_INCREMENT=1000000
RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
RUBY_GC_MALLOC_LIMIT=1000000000
RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_FREE_MIN RUBY_GC_MALLOC_LIMIT RUBY_HEAP_SLOTS_GROWTH_FACTOR RUBY_HEAP_SLOTS_INCREMENT RUBY_HEAP_MIN_SLOTS

# rbenv configuation
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  eval "$(rbenv init -)"
  export PATH="${RBENV_ROOT}/bin:${PATH}"
fi

function psy(){python -m SimpleHTTPServer 8000 && open "http://localhost:8000"}

#nvm setup
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

# ImageMagick fun times
export MAGICK_HOME="/usr/local/ImageMagick-6.8.7-7"
export PATH="$MAGICK_HOME/bin:$PATH"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


### Cudaminer
export PATH=/Developer/NVIDIA/CUDA-5.5/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.5/lib:$DYLD_LIBRARY_PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

source $HOME/.awsenv
