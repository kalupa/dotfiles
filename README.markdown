Install spf13 vim
    curl http://j.mp/spf13-vim3 -L -o - | sh

symlink the appropriate files to the folders/files here in your home.

    ln -nfs dotfiles/vimrc.local .vimrc.local
    ln -nfs dotfiles/vimrc.bundle.local .vimrc.bundle.local
    ln -nfs dotfiles/zshrc .zshrc
    ln -nfs dotfiles/tmux.conf tmux.conf
    ln -nfs dotfiles/screenrc .screenrc
