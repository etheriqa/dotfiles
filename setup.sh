#!/bin/sh

DOT_FILES=( .zshrc .tmux.conf .vimrc .gvimrc .gitconfig .gitignore )

for file in ${DOT_FILES[@]}
do
  ln -fsv $HOME/work/dotfiles/$file $HOME/$file
done
