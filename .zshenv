export LANG=en_US.UTF-8
export EDITOR=vim
export TERM=xterm-256color

case $OSTYPE in
  darwin*)
    if [ -f $HOME/.zshenv.darwin ]; then . $HOME/.zshenv.darwin; fi
esac

if [ -f $HOME/.zshenv.local ]; then . $HOME/.zshenv.local; fi
