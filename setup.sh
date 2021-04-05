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
  echo "Updating homebrew"
  brew update
fi

# Install Oh My Zsh
if [[ ! -d ~/.oh-my-zsh ]]
then
  echo "Installing Oh My Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Cleanup files for install
sudo rm -rf ~/.config/nvim > /dev/null 2>&1
sudo rm -rf ~/.vim/custom > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/Brewfile > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.alacritty.yml > /dev/null 2>&1

# Add symlinks
mkdir ~/.config/nvim
ln -sf ~/dotfiles/config/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/config/nvim/lua ~/.config/nvim/lua
ln -sf ~/dotfiles/config/zshrc ~/.zshrc
ln -sf ~/dotfiles/config/Brewfile ~/Brewfile
ln -sf ~/dotfiles/config/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/config/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/config/.alacritty.yml ~/.alacritty.yml

# Install brewfiles
cd ~
brew bundle
cd -

npm install -g typescript typescript-language-server prettier \
  vscode-html-languageserver-bin vscode-css-languageserver-bin

# Setup
source ~/.zshrc

if [[ ! -e ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
  git clone https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# Setup git hooks
cp hooks/* .git/hooks

echo "Done!"
