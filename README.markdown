Install homebrew
```sh
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

Install nvm
```sh
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
```

Install dependencies
```sh
brew install ack ctags mercurial git hub vim z zsh gnu-tar rbenv ruby-build irssi
```

Install spf13-vim
```sh
curl http://j.mp/spf13-vim3 -L -o - | sh
```

Symlink the appropriate files to the folders/files here in your home.
```sh
ln -nfs ~/dotfiles/vimrc.local ~/.vimrc.local
ln -nfs ~/dotfiles/vimrc.bundle.local ~/.vimrc.bundle.local
ln -nfs ~/dotfiles/zshrc ~/.zshrc
ln -nfs ~/dotfiles/tmux.conf ~/.tmux.conf
ln -nfs ~/dotfiles/screenrc ~/.screenrc
```
