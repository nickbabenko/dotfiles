# Setup

# Install dotfiles
if [ -d ~/dotfiles ] 
then
   cd ~/dotfiles
   git pull
else
    git clone git@github.com:nickbabenko/dotfiles.git ~/dotfiles
    cd ~/dotfiles
fi

# Install Homebrew
if [[ $(command -v brew) == "" ]]; then
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Updating homebre"
  brew update
fi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cleanup files for install
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.vim/custom > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/Brewfile > /dev/null 2>&1

# Add symlinks
ln -sf ~/dotfiles/config/vimrc ~/.vimrc
ln -sf ~/dotfiles/config/vim ~/.vim/custom
ln -sf ~/dotfiles/config/zshrc ~/.zshrc
ln -sf ~/dotfiles/config/Brewfile ~/Brewfile

# Install brewfiles
cd ~
brew bundle
cd -

# Setup
source ~/.zshrc

# Vim plug
curl -fLo '~/.vim/autoload/plug.vim' --create-dirs \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Setup git hooks
cp hooks/* .git/hooks

echo "Done!"
