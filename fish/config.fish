powerline-daemon -q

# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell
# plugins
set fish_plugins osx rbenv ssh tmux brew cask bundler node python

. $fish_path/oh-my-fish.fish

set fish_function_path $fish_function_path (brew --prefix)/lib/python2.7/site-packages/powerline/bindings/fish
powerline-setup

alias ll "ls -la"
alias l "ls -l"

# http://fishshell.com/docs/2.1/#variables-special
set --erase fish_greeting

. $HOME/.config/fish/solarized.fish
[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

gulp --completion=fish | source

set JAVA_HOME (jenv javahome)
