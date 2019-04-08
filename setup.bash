#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  if [[ -z "$(command -v brew)" ]]; then
    echo "Homebrew not found. Installing ..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ -z "$(command -v git)" ]]; then
      brew install git
    fi
    # cd ~
    # git clone --recursive https://github.com/kalupa/dotfiles.git ~/dotfiles
    # pushd ~/dotfiles
    # brew bundle install --file=./mac-homebrew/.Brewfile
    # echo "Setting up zsh shell"
    # zsh_location=$(command -v zsh)
    # echo "$zsh_location" | sudo tee -a /etc/shells > /dev/null
    # chsh -s "$zsh_location"
    exit 1
  fi
fi

# command -v git &>/dev/null || die "git not installed. Please install before proceeding."
# cd ~
# git clone --recursive https://github.com/kalupa/dotfiles.git ~/dotfiles
# pushd ~/dotfiles

if [ -z "$(command -v stow)" ]; then
  echo "GNU Stow not found. Installing ..."
  brew install stow
  exit 1
fi

echo "Ensure submodules are set up"
git submodule init; git submodule update

# echo "Setting up antigen for zsh"
# curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh

stow -S zsh git file-formats vim spacemacs home-bin
# hammerspoon mac-homebrew
