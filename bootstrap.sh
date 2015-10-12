#!/bin/bash

set -e

PREFIX=${PREFIX-$HOME/src/github.com/etheriqa}

mkdir -p $PREFIX
git clone https://github.com/etheriqa/dotfiles.git $PREFIX/dotfiles
cd $PREFIX/dotfiles
make install PREFIX=$HOME
