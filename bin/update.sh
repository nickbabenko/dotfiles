PREVIOUS_DIR=$PWD
cd ~/dotfiles
if [[ `git status --porcelain` ]]; then
  echo "Updating dotfiles"
  git pull
fi
cd $PREVIOUS_DIR
