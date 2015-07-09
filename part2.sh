#! /bin/bash

echo "Installing oh my zsh"
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells > /dev/null
chsh -s /usr/local/bin/zsh
curl -L http://install.ohmyz.sh | sh

echo "Linking dotfiles"
ln -nfs ~/dotfiles/vimrc ~/.vimrc
ln -nfs ~/dotfiles/vim ~/.vim
ln -nfs ~/dotfiles/spacemacs ~/.spacemacs
ln -nfs ~/dotfiles/zshrc ~/.zshrc
ln -nfs ~/dotfiles/tmux.conf ~/.tmux.conf
ln -nfs ~/dotfiles/tmuxinator ~/.tmuxinator
ln -nfs ~/dotfiles/screenrc ~/.screenrc
ln -nfs ~/dotfiles/irssi ~/.irssi
ln -nfs ~/dotfiles/emacs ~/.emacs.d
ln -nfs ~/dotfiles/oh-my-zsh/themes/bullet-train-oh-my-zsh-theme/bullet-train.zsh-theme ~/.oh-my-zsh/themes/bullet-train.zsh-theme

echo "Installing python things"
pip install aws awscli boto powerline-status virtualenv virtualenvwrapper
