## On Mac
Install homebrew
```sh
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew install ctags mercurial git hub vim z zsh rbenv ruby-build irssi openssl tmux the_silver_searcher
```

## On Linux
```sh
sudo apt-get install mercurial git libssl-dev exuberant-ctags silversearcher-ag irssi rbenv ruby-build tmux zsh irssi
```
Setup node on Ubuntu:
```sh
curl -sL https://deb.nodesource.com/setup | sudo bash -
```
Then install:
```sh
sudo apt-get install -y nodejs
```

## On Any

Install ruby
```sh
rbenv install --list
rbenv install <latest>
```

Install Oh My Zsh
```sh
curl -L http://install.ohmyz.sh | sh
```

Symlink the appropriate files to the folders/files here in your home.
```sh
ln -nfs ~/dotfiles/vimrc ~/.vimrc
ln -nfs ~/dotfiles/vim ~/.vim
ln -nfs ~/dotfiles/zshrc ~/.zshrc
ln -nfs ~/dotfiles/tmux.conf ~/.tmux.conf
ln -nfs ~/dotfiles/tmuxinator ~/.tmuxinator
ln -nfs ~/dotfiles/screenrc ~/.screenrc
ln -nfs ~/dotfiles/irssi ~/.irssi
```

Install neocomplete
```sh
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
vim # and let neobundle install it's packages 
```
