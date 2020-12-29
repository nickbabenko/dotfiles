cd ~/dotfiles
if [[ `git status --porcelain` ]]; then
  echo "Updating dotfiles"
  git pull
fi
