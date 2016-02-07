#!/bin/bash

echo "Installing caskroom"
brew install caskroom/cask/brew-cask

brew update
echo "Installing mac apps with cask"
brew cask install 1password atom bittorrent-sync
brew cask install chrome-devtools dash diffmerge evernote-mac fantastical
brew cask install firefox flashlight flux gitup
brew cask install google-chrome gpgtools iterm2 karabiner kdiff3
brew cask install macdown spotify seil
brew cask install sequel-pro slack soulver spideroak things virtualbox vlc
