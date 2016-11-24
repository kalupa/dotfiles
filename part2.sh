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
ln -nfs ~/dotfiles/irssi ~/.irssi
ln -nfs ~/dotfiles/jsbeautifyrc ~/.jsbeautifyrc

echo "Installing Spacemacs"
cd ~
#mv .emacs.d .emacs.bak
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# echo "Setting up GitHub ssh keys"
# echo "login to github.com before proceeding ...\n\n"
# read -p "Please enter email address:" gh_email
# ssh-keygen -t rsa -b 4096 -C "$gh_email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# echo "Copying pub key to macOS clipboard"
# pbcopy < ~/.ssh/id_rsa.pub

read -p "Install python things?" yn
case $yn in
    [Yy]* ) pip install aws awscli boto powerline-status virtualenv virtualenvwrapper; break;;
    [Nn]* ) echo "skipping ..."; break;;
    * ) echo "Please answer yes or no.";;
esac

read -p "Install powerline-enabled fonts?"
case $yn in
    [Yy]* ) cd ~
            mkdir -p tmp
            cd ~/tmp
            git clone https://github.com/powerline/fonts.git powerline-fonts
            cd powerline-fonts
            ./install.sh
            break;;
    [Nn]* ) echo "skipping ..."; break;;
    * ) echo "Please answer yes or no.";;
esac
