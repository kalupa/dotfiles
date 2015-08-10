#! /bin/bash

echo "Installing homebrew from source"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
printf "\n"

echo "Tapping versions and dupes"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap railwaycat/emacsmacport
printf "\n"

echo "Installing tools"
brew update
brew install ack ag apple-gcc42 autojump atk casperjs colordiff coreutils ctags gnutls
brew install gnu-typist gpg-agent imagemagick jenv jpeg jq markdown meld mercurial
brew install mysql node openssl parallel pt python rbenv ruby-build tree tmux
brew install tmux-mem-cpu-load vim watchman zsh

# brew install flow
printf "\n"

echo "Installing tools with options"
brew install emacs-mac --with-spacemacs-icon --with-xml2 --with-gnutls --with-ctags --with-imagemagick --with-glib
brew install git --with-brewed-curl --with-brewed-openssl --with-gettext --with-pcre --with-blk-sha1
brew install gnugo2 --with-readline
brew install reattach-to-user-namespace  --with-wrap-launchctl --with-wrap-pbcopy-and-pbpaste
printf "\n"

echo "Setting tab completions ..."
ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions

printf "\n\n"
