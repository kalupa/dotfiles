source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/ec2

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Enable RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

