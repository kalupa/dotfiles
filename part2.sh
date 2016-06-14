#! /bin/bash

echo "Ensure submodules are set up"
git submodule init; git submodule update

read -p "Installing oh my zsh" yn
case $yn in
    [Yy]* ) ln -nfs ~/dotfiles/vimrc ~/.vimrc
            echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells > /dev/null
            chsh -s /usr/local/bin/zsh
            curl -L http://install.ohmyz.sh | sh
            break;;
    [Nn]* ) echo "skipping ..."; break;;
    * ) echo "Please answer yes or no.";;
esac

read -p "Link dotfiles?" yn
case $yn in
    [Yy]* ) ln -nfs ~/dotfiles/vimrc ~/.vimrc
            ln -nfs ~/dotfiles/vim ~/.vim
            ln -nfs ~/dotfiles/spacemacs ~/.spacemacs
            ln -nfs ~/dotfiles/zshrc ~/.zshrc
            ln -nfs ~/dotfiles/zsh_env ~/.zshenv
            ln -nfs ~/dotfiles/tmux.conf ~/.tmux.conf
            ln -nfs ~/dotfiles/tmuxinator ~/.tmuxinator
            ln -nfs ~/dotfiles/screenrc ~/.screenrc
            ln -nfs ~/dotfiles/irssi ~/.irssi
            ln -nfs ~/dotfiles/oh-my-zsh/themes/bullet-train-oh-my-zsh-theme/bullet-train.zsh-theme ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
            break;;
    [Nn]* ) echo "skipping ..."; break;;
    * ) echo "Please answer yes or no.";;
esac

read -p "Install python things?" yn
case $yn in
    [Yy]* ) pip install aws awscli boto powerline-status virtualenv virtualenvwrapper; break;;
    [Nn]* ) echo "skipping ..."; break;;
    * ) echo "Please answer yes or no.";;
esac

read -p "Install powerline-enabled fonts?"
case $yn in
    [Yy]* ) ln -nfs ~/dotfiles/vimrc ~/.vimrc
            cd ~
            mkdir -p tmp
            cd ~/tmp
            git clone https://github.com/powerline/fonts.git powerline-fonts
            cd powerline-fonts
            ./install.sh
            break;;
    [Nn]* ) echo "skipping ..."; break;;
    * ) echo "Please answer yes or no.";;
esac

read -p "Set up GitHub ssh keys?" yn
case $yn in
    [Yy]* ) ln -nfs ~/dotfiles/vimrc ~/.vimrc
            echo "login to github.com before proceeding ...\n\n"
            read -p "Please enter email address:" gh_email
            ssh-keygen -t rsa -b 4096 -C "$gh_email"
            eval "$(ssh-agent -s)"
            ssh-add ~/.ssh/id_rsa
            echo "Copied pub key to Clipboard"
            pbcopy < ~/.ssh/id_rsa.pub
            break;;
    [Nn]* ) echo "skipping ..."; break;;
    * ) echo "Please answer yes or no.";;
esac

read -p "Install Spacemacs?" yn
case $yn in
    [Yy]* ) cd ~
        mv .emacs.d .emacs.bak
        git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d
        break;;

    [Nn]* ) echo "skipping ..."; break;;
    * ) echo "Please answer yes or no.";;
esac
