#!/bin/sh

cd `dirname $0`

for dotfile in `git ls-files|sed -e 's/\/.*$//'|uniq`; do
  if [ $dotfile != `basename $0` ]; then
    ln -fsv --target-directory=$HOME `pwd`/$dotfile
  fi
done
