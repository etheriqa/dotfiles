#!/bin/sh

cd `dirname $0`

for dotfile in `git ls-files`; do
  if [ $dotfile != `basename $0` ]; then
    ln -fsv `pwd`/$dotfile $HOME/$dotfile
  fi
done
