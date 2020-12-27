# Install Homebrew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#brew doctor
#brew update

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cleanup files for install
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.vim/customx > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/Brewfile > /dev/null 2>&1

# Add symlinks
ln -sf ~/dotfiles/config/vimrc ~/.vimrc
ln -sf ~/dotfiles/config/vim ~/.vim/custom
ln -sf ~/dotfiles/config/zshrc ~/.zshrc
ln -sf ~/dotfiles/config/Brewfile ~/Brewfile

# Brewfiles
cd ~
brew bundle
cd -

# Setup
source ~/.zshrc

# Vim deps
curl -fLo '~/.vim/autoload/plug.vim' --create-dirs \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Done!"
