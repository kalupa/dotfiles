#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
	if [[ -z "$(command -v brew)" ]]; then
		echo "Homebrew not found. Installing ..."
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	if [[ -z "$(command -v git)" ]]; then
		echo "git not found. Installing ..."
		brew install git
	fi
	if [ -z "$(command -v stow)" ]; then
		echo "GNU Stow not found. Installing ..."
		brew install stow
		exit 1
	fi
	echo "Installing Brewfile ..."
	stow -S mac-homebrew && brew bundle install --global
	echo "Done!"
	echo ""
	echo "Linking some other configs ..."
	stow hammerspoon

fi

stow -S zsh git file-formats home-bin

echo "Installing nvm and node stable ..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install stable
echo "Done!"
echo ""

echo "Setting up zsh shell ..."
zsh_location=$(command -v zsh)
echo "$zsh_location" | sudo tee -a /etc/shells >/dev/null
chsh -s "$zsh_location"
echo "... antigen "
git clone https://github.com/zsh-users/antigen.git $HOME/.antigen.git
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh >antigen.zsh
npm install --global pure-prompt

echo "Ensure submodules are set up"
git submodule init
git submodule update

# clone doom emacs from source instead of the linked version
# bin/doom install
# 1password (if not there by brewfile)
# resilio
# bartender
# text expander
# doom autoloads
# spectacles
# karabiner-elements
