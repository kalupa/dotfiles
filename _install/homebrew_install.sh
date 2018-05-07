#! /bin/bash

# TODO: make an apt version for linux installations

echo "Installing homebrew from source"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
printf "\n"

echo "Installing brewed ..."
$(./brew-installed.sh)

#echo "Installing tools with options"
#brew install gnugo2 --with-readline
printf "\n"

echo "Setting tab completions ..."
ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions

printf "\n\n"
