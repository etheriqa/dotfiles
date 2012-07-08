#!/bin/sh

DOT_FILES=( .vimrc .gvimrc .gitconfig .gitignore)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
