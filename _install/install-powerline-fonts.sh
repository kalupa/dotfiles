#!/bin/bash

echo "Installing Powerline-enabled fonts ..."
cd ~
mkdir -p tmp
cd ~/tmp
git clone https://github.com/powerline/fonts.git powerline-fonts
cd powerline-fonts
./install.sh
