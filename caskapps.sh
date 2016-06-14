#!/bin/bash

echo "Installing caskroom"
brew install caskroom/cask/brew-cask

brew update
echo "Installing mac apps with cask"
brew cask install atom bittorrent-sync
brew cask install dash diffmerge
brew cask install flashlight flux gitup
brew cask install google-chrome gpgtools iterm2 karabiner kdiff3
brew cask install macdown seil
brew cask install sequel-pro virtualbox vlc
