#!/bin/sh

case $OSTYPE in
  darwin*)
    pmset -g ps | grep --only-matching "[[:digit:]]\+%"
    ;;
esac
