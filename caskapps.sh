#!/bin/bash

echo "Installing caskroom"
brew install caskroom/cask/brew-cask

brew update
echo "Installing mac apps with cask"
brew cask install 1password airfoil atom boot2docker battle-net bittorrent-sync
brew cask install chrome-devtools dash diffmerge evernote emacs-mac fantastical
brew cask install firefox flashlight flux garmin-ant-agent gitup
brew cask install garmin-basecamp garmin-express garmin-training-center google-chrome
brew cask install gpgtools hipchat iterm2 karabiner kdiff3 macdown spotify seil
brew cask install sequel-pro skitch slack soulver spideroak things virtualbox vlc
