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
sudo rm -rf ~/.alacritty.yml > /dev/null 2>&1
sudo rm -rf ~/.prettierrc.js > /dev/null 2>&1

# Add symlinks
ln -sf ~/dotfiles/config/nvim ~/.config/nvim
ln -sf ~/dotfiles/config/zshrc ~/.zshrc
ln -sf ~/dotfiles/config/Brewfile ~/Brewfile
ln -sf ~/dotfiles/config/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/config/.alacritty.yml ~/.alacritty.yml
ln -sf ~/dotfiles/config/prettierrc.js ~/.prettierrc.js

# Install brewfiles
cd ~
brew bundle
cd -

echo "Installing NPM dependencies"
npm install -g typescript typescript-language-server prettier \
  vscode-html-languageserver-bin vscode-css-languageserver-bin \
  @prettier/plugin-lua @prettier/plugin-php bash-language-server \
  intelephense

# Setup
source ~/.zshrc

git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Vim plug
curl -fLo '~/.vim/autoload/plug.vim' --create-dirs \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Setup git hooks
cp hooks/* .git/hooks

# Update nvim packages
#nvim +PackerUpdate +qall 

echo "Done!"
