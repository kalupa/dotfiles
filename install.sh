command -v git &>/dev/null || die "git not installed. Please install before proceeding."

cd ~
git clone --recursive https://github.com/kalupa/dotfiles.git ~/dotfiles

cd ~/dotfiles
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
