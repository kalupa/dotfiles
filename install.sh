#!/bin/bash

command -v git &>/dev/null || die "git not installed. Please install before proceeding."

cd ~
git clone --recursive https://github.com/kalupa/dotfiles.git ~/dotfiles

cd ~/dotfiles

if [[ `uname` == "Darwin" ]]; then
    read -p "Use homebrew?" yn
    case $yn in
        [Yy]* ) ./homebrew_install.sh; break;;
        [Nn]* ) echo "skipping ..."; break;;
        * ) echo "Please answer yes or no.";;
    esac

    read -p "Install Cask apps?" yn
    case $yn in
        [Yy]* ) ./cask_apps.sh; break;;
        [Nn]* ) echo "skipping ..."; break;;
        * ) echo "Please answer yes or no.";;
    esac
elif [[ `uname` == "Linux" ]]; then
    echo "use apt-get I guess!"
    # sudo apt-get install emacs
    # sudo apt-get install ack ag autojump atk casperjs colordiff coreutils ctags
    # sudo apt-get install gnu-typist gpg-agent imagemagick jq markdown meld
    # sudo apt-get install openssl parallel pt python rbenv ruby-build tree tmux
    # brew install vim watchman zsh
fi
