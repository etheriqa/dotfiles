export LANG=en_US.UTF-8
export EDITOR=vim
export TERM=screen-256color

case $OSTYPE in
  darwin*)
    if [ -f $HOME/.zshenv.darwin ]; then . $HOME/.zshenv.darwin; fi
    ;;
  linux*)
    if [ -f $HOME/.zshenv.linux ]; then . $HOME/.zshenv.linux; fi
    ;;
esac

if [ -f $HOME/.zshenv.local ]; then . $HOME/.zshenv.local; fi
