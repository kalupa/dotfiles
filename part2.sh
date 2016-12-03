#! /bin/bash

pushd ~/dotfiles

echo "Ensure submodules are set up"
git submodule init; git submodule update

popd
echo "Setting up zsh shell"
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells > /dev/null
chsh -s /usr/local/bin/zsh
echo "Setting up antigen for zsh"
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh
source antigen.zsh

echo "Linking dotfiles"
ln -nfs ~/dotfiles/vimrc ~/.vimrc
ln -nfs ~/dotfiles/vim ~/.vim
ln -nfs ~/dotfiles/spacemacs ~/.spacemacs
ln -nfs ~/dotfiles/gitconfig ~/.gitconfig
ln -nfs ~/dotfiles/zshrc ~/.zshrc
ln -nfs ~/dotfiles/zshenv ~/.zshenv
ln -nfs ~/dotfiles/tmux.conf ~/.tmux.conf
ln -nfs ~/dotfiles/tmuxinator ~/.tmuxinator
ln -nfs ~/dotfiles/screenrc ~/.screenrc
ln -nfs ~/dotfiles/jsbeautifyrc ~/.jsbeautifyrc

mkdir ~/bin
ln -nfs ~/dotfiles/ubuntu_update.sh ~/bin/system_update

echo "Installing Spacemacs"
pushd ~
#mv .emacs.d .emacs.bak
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
popd

read -p "Generate new ssh keys for github?" yn
case $yn in
    [Yy]* ) $(bash ./generate-github-ssh-keys.sh); break;;
    [Nn]* ) echo "skipping ..."; break;;
esac

read -p "Install python things?" yn
case $yn in
    [Yy]* ) pip install aws awscli boto powerline-status virtualenv virtualenvwrapper; break;;
    [Nn]* ) echo "skipping ..."; break;;
    * ) echo "Please answer yes or no.";;
esac

read -p "Install powerline-enabled fonts?"
case $yn in
    [Yy]* ) $(bash ./install-powerline-fonts.sh)break;;
    [Nn]* ) echo "skipping ..."; break;;
    * ) echo "Please answer yes or no.";;
esac
